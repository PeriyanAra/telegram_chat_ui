import 'package:flutter_mobile_app_foundation/presentation/chat/enums/user_activity_status.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/view_models/chat_message_view_model.dart';
import 'package:flutter_mobile_app_foundation/presentation/common/view_models/user_info_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_screen_view_model.freezed.dart';

@freezed
class ChatScreenViewModel with _$ChatScreenViewModel {
  const factory ChatScreenViewModel({
    required String chatTitle,
    required UserInfoViewModel sender,
    required UserActivityStatus activityStatus,
    required List<ChatMessageViewModel> messages,
  }) = _ChatScreenViewModel;
}
