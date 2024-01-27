part of 'chat_screen_bloc.dart';

@freezed
class ChatScreenEvent with _$ChatScreenEvent {
  const factory ChatScreenEvent.getData() = ChatScreenGetDataEvent;

  const factory ChatScreenEvent.sendMessage({
    required ChatMessageViewModel message,
  }) = ChatScreenSendMessageEvent;

  const factory ChatScreenEvent.likeMessage({
    required String id,
    required String reactionIcon,
  }) = ChatScreenLikeMessageEvent;

  const factory ChatScreenEvent.deleteMessage({
    required ChatMessageViewModel message,
  }) = ChatScreenDeleteMessageEvent;

  const factory ChatScreenEvent.shareMessage({
    required ChatMessageViewModel message,
  }) = ChatScreenShareMessageEvent;

  const factory ChatScreenEvent.copyMessage({
    required ChatMessageViewModel message,
  }) = ChatScreenCopyMessageEvent;

  const factory ChatScreenEvent.answerMessage({
    required ChatMessageViewModel message,
  }) = ChatScreenAnswerMessageEvent;
}
