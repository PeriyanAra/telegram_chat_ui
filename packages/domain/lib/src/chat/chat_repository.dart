import 'package:data/data_layer.dart';
import 'package:domain/src/index.dart';

abstract class ChatRepository {
  Future<Result<MessageDto, FailureResult>> sendMessage(String message);

  Future<Result<void, FailureResult>> deleteMessage(String messageId);

  Future<Result<List<MessageDto>, FailureResult>> fetchData();
}
