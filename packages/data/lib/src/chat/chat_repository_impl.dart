import 'package:data/src/chat/data_source/index.dart';
import 'package:data/src/chat/dto/message_dto.dart';
import 'package:domain/domain_layer.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatLocalDataSource _chatLocalDataSource;

  ChatRepositoryImpl({
    required ChatLocalDataSource chatLocalDataSource,
  }) : _chatLocalDataSource = chatLocalDataSource;

  @override
  Future<Result<MessageDto, FailureResult>> sendMessage(String message) {
    return _chatLocalDataSource.sendMessage(message);
  }

  @override
  Future<Result<void, FailureResult>> deleteMessage(String messageId) {
    return _chatLocalDataSource.deleteMessage(messageId);
  }

  @override
  Future<Result<List<MessageDto>, FailureResult>> fetchData() {
    return _chatLocalDataSource.fetchData();
  }
}
