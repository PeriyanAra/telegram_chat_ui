import 'package:domain/src/index.dart';

class ChatUseCase {
  final ChatRepository _chatRepository;

  ChatUseCase({
    required ChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  Future<Result<MessageEntity, FailureResult>> sendMessage({
    required String message,
  }) async {
    final messageResponse = await _chatRepository.sendMessage(message);

    return messageResponse.when(
      success: (messageDto) {
        return Result.success(
          MessageEntity.fromDto(messageDto),
        );
      },
      failure: (f) {
        return Result.failure(f);
      },
    );
  }

  Future<Result<void, FailureResult>> deleteMessage({
    required String messageId,
  }) {
    return _chatRepository.deleteMessage(messageId);
  }

  Future<Result<List<MessageEntity>, FailureResult>> fetchData() async {
    final response = await _chatRepository.fetchData();

    return response.when(
      success: (messagesDto) {
        final messages = messagesDto.map(MessageEntity.fromDto).toList();

        return Result.success(messages);
      },
      failure: (f) {
        return Result.failure(f);
      },
    );
  }
}
