import 'dart:convert';

class MessageDto {
  final int messageId;
  final bool isOwnerMessage;
  final bool isViewed;
  final String message;
  final String time;
  MessageDto({
    required this.messageId,
    required this.isOwnerMessage,
    required this.isViewed,
    required this.message,
    required this.time,
  });

  MessageDto copyWith({
    int? messageId,
    bool? isOwnerMessage,
    bool? isViewed,
    String? message,
    String? time,
  }) {
    return MessageDto(
      messageId: messageId ?? this.messageId,
      isOwnerMessage: isOwnerMessage ?? this.isOwnerMessage,
      isViewed: isViewed ?? this.isViewed,
      message: message ?? this.message,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageId': messageId,
      'isOwnerMessage': isOwnerMessage,
      'isViewed': isViewed,
      'message': message,
      'time': time,
    };
  }

  factory MessageDto.fromMap(Map<String, dynamic> map) {
    return MessageDto(
      messageId: map['messageId'] as int,
      isOwnerMessage: map['isOwnerMessage'] == 'true',
      isViewed: map['isViewed']  == 'true',
      message: map['message'] as String,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageDto.fromJson(String source) => MessageDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageDto(messageId: $messageId, isOwnerMessage: $isOwnerMessage, isViewed: $isViewed, message: $message, time: $time)';
  }

  @override
  bool operator ==(covariant MessageDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.messageId == messageId &&
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
