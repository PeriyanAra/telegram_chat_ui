import 'package:domain/domain_layer.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/enums/message_type.dart';
import 'package:flutter_mobile_app_foundation/presentation/common/view_models/user_info_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_view_model.freezed.dart';

@freezed
class ChatMessageViewModel with _$ChatMessageViewModel {
  const factory ChatMessageViewModel({
    required String id,
    required DateTime time,
    required String message,
    required MessageType type,
    required bool isOwnerMessage,
    required bool isArrived,
    required bool isSeen,
    @Default(false) bool isLiked,
    @Default('') String reactionIcon,
    UserInfoViewModel? sender,
  }) = _ChatMessageViewModel;

  const ChatMessageViewModel._();

  factory ChatMessageViewModel.fromEntity(
    MessageEntity entity,
  ) {
    return ChatMessageViewModel(
      id: entity.messageId.toString(),
      time: entity.time,
      message: entity.message,
      type: MessageType.text,
      isOwnerMessage: entity.isOwnerMessage,
      isArrived: entity.isViewed,
      isSeen: entity.isViewed,
    );
  }
}
