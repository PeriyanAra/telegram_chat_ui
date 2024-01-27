import 'dart:math' as math;

import 'package:data/src/chat/dto/message_dto.dart';
import 'package:data/src/database/database_constants.dart';
import 'package:domain/domain_layer.dart';
import 'package:sqflite/sqflite.dart';

class ChatLocalDataSource {
  ChatLocalDataSource({
    required Database database,
  }) : _database = database;
  final Database _database;

  Future<Result<MessageDto, FailureResult>> sendMessage(String message) async {
    if (message.isEmpty) {
      return Future.value(
        const Result.failure(
          FailureResult(
            reason: FailureReasons.unknown,
            debugMessage: 'Message can not be empty',
          ),
        ),
      );
    }
    final idResponse = await _database.rawQuery(
        'SELECT ${DatabaseConstants.chatIdColumnName} FROM ${DatabaseConstants.chatTableName} ORDER BY ${DatabaseConstants.chatIdColumnName} DESC LIMIT 1');
    int? _lastId;
    if (idResponse.isNotEmpty) {
      _lastId = idResponse.first.values.first as int;
    }

    try {
      final messageDto = MessageDto(
        messageId: (_lastId != null) ? _lastId + 1 : 0,
        isOwnerMessage: _randomBoolean(),
        isViewed: _randomBoolean(),
        message: message,
        time: DateTime.now().toString(),
      );

      final batch = _database.batch();

      batch.rawInsert(
        '''
            INSERT INTO ${DatabaseConstants.chatTableName}(
                ${DatabaseConstants.chatIdColumnName},
                ${DatabaseConstants.chatIsOwnerMessageColumnName},
                ${DatabaseConstants.chatViewColumnName},
                ${DatabaseConstants.chatMessageColumnName},
                ${DatabaseConstants.chatTimeColumnName}
         

            ) VALUES(?, ?, ?, ?, ?)
        ''',
        [
          messageDto.messageId,
          messageDto.isOwnerMessage,
          messageDto.isViewed,
          messageDto.message,
          messageDto.time,
        ],
      );

      return Future.value(
        Result.success(
          messageDto,
        ),
      );
    } catch (e) {
      return Future.value(
        Result.failure(
          FailureResult(
            reason: FailureReasons.unknown,
            debugMessage: e.toString(),
          ),
        ),
      );
    }
  }

  Future<Result<void, FailureResult>> deleteMessage(String messageId) async {
    if (messageId.isEmpty) {
      return Future.value(
        const Result.failure(
          FailureResult(
            reason: FailureReasons.unknown,
            debugMessage: 'Message can not be empty',
          ),
        ),
      );
    }

    try {
      await _database.rawDelete(
          'DELETE * FROM ${DatabaseConstants.chatIdColumnName} WHERE ${DatabaseConstants.chatIdColumnName} = $messageId ');

      return Future.value(
        const Result.success(
          null,
        ),
      );
    } catch (e) {
      return Future.value(
        Result.failure(
          FailureResult(
            reason: FailureReasons.unknown,
            debugMessage: e.toString(),
          ),
        ),
      );
    }
  }

  Future<Result<List<MessageDto>, FailureResult>> fetchData() async {
    try {
      final response = await _database.rawQuery(
        'SELECT * FROM ${DatabaseConstants.chatIdColumnName}',
      );

      if (response.isNotEmpty) {
        return Result.success(
          response.map(
            (e) {
              final newE = {
                DatabaseConstants.chatIdColumnName:
                    e[DatabaseConstants.chatIdColumnName],
                DatabaseConstants.chatIsOwnerMessageColumnName:
                    e[DatabaseConstants.chatIsOwnerMessageColumnName],
                DatabaseConstants.chatMessageColumnName:
                    e[DatabaseConstants.chatMessageColumnName],
                DatabaseConstants.chatTimeColumnName:
                    e[DatabaseConstants.chatTimeColumnName],
                DatabaseConstants.chatViewColumnName:
                    e[DatabaseConstants.chatViewColumnName],
              };

              return MessageDto.fromMap(newE);
            },
          ).toList(),
        );
      }

      return Future.value(
        const Result.success(
          [],
        ),
      );
    } catch (e) {
      return Future.value(
        Result.failure(
          FailureResult(
            reason: FailureReasons.unknown,
            debugMessage: e.toString(),
          ),
        ),
      );
    }
  }

  bool _randomBoolean() {
    final random = math.Random();
    return random.nextBool();
  }
}
