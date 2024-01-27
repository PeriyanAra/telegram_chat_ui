import 'package:data/data_layer.dart';

class MessageEntity {
  final int messageId;
  final bool isOwnerMessage;
  final bool isViewed;
  final String message;
  final DateTime time;
  MessageEntity({
    required this.messageId,
    required this.isOwnerMessage,
    required this.isViewed,
    required this.message,
    required this.time,
  });

  MessageEntity copyWith({
    int? messageId,
    bool? isOwnerMessage,
    bool? isViewed,
    String? message,
    DateTime? time,
  }) {
    return MessageEntity(
      messageId: messageId ?? this.messageId,
      isOwnerMessage: isOwnerMessage ?? this.isOwnerMessage,
      isViewed: isViewed ?? this.isViewed,
      message: message ?? this.message,
      time: time ?? this.time,
    );
  }

  factory MessageEntity.fromDto(
    MessageDto dto,
  ) {
    return MessageEntity(
      messageId: dto.messageId,
      isOwnerMessage: dto.isOwnerMessage,
      isViewed: dto.isViewed,
      message: dto.message,
      time: DateTime.tryParse(dto.time) ?? DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'MessageEntity(messageId: $messageId, isOwnerMessage: $isOwnerMessage, isViewed: $isViewed, message: $message, time: $time)';
  }

  @override
  bool operator ==(covariant MessageEntity other) {
    if (identical(this, other)) return true;

    return other.messageId == messageId &&
        other.isOwnerMessage == isOwnerMessage &&
        other.isViewed == isViewed &&
        other.message == message &&
        other.time == time;
  }

  @override
  int get hashCode {
    return messageId.hashCode ^
        isOwnerMessage.hashCode ^
        isViewed.hashCode ^
        message.hashCode ^
        time.hashCode;
  }
}
