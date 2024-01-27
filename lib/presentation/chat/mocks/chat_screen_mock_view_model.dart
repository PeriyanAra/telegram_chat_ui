import 'package:flutter_mobile_app_foundation/presentation/chat/enums/message_type.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/enums/user_activity_status.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/view_models/chat_message_view_model.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/view_models/chat_screen_view_model.dart';
import 'package:flutter_mobile_app_foundation/presentation/common/view_models/user_info_view_model.dart';

final chatScreenMockViewModel = ChatScreenViewModel(
  chatTitle: 'Sample Group Chat',
  sender: const UserInfoViewModel(
    firstName: 'John',
    lastName: 'Doe',
    imageUrl: 'https://example.com/avatar.jpg',
  ),
  activityStatus: UserActivityStatus.online,
  messages: [
    ChatMessageViewModel(
      id: '11',
      time: DateTime.now().subtract(const Duration(minutes: 15)),
      message: 'Hello world!',
      type: MessageType.text,
      isOwnerMessage: true,
      isArrived: true,
      isSeen: false,
      sender: const UserInfoViewModel(
        firstName: 'Tony',
        lastName: 'Stark',
        imageUrl:
            'https://wellgroomedgentleman.com/wp-content/uploads/2023/10/Tony_Stark_Beard_with_Quiff_Hairstyle.width-800.jpg',
      ),
    ),
    ChatMessageViewModel(
      id: '12',
      time: DateTime.now().subtract(const Duration(minutes: 10)),
      message: 'Hi there!',
      type: MessageType.text,
      isOwnerMessage: false,
      isArrived: true,
      isSeen: true,
      sender: const UserInfoViewModel(
        firstName: 'Jane',
        lastName: 'Smith',
        imageUrl:
            'https://i.pinimg.com/474x/ee/79/3d/ee793dfb2085b85ce187909013a43816.jpg',
      ),
    ),
    ChatMessageViewModel(
      id: '13',
      time: DateTime.now().subtract(const Duration(minutes: 5)),
      message: 'How are you?',
      type: MessageType.text,
      isOwnerMessage: true,
      isArrived: true,
      isSeen: false,
      sender: const UserInfoViewModel(
        firstName: 'Tony',
        lastName: 'Stark',
        imageUrl:
            'https://wellgroomedgentleman.com/wp-content/uploads/2023/10/Tony_Stark_Beard_with_Quiff_Hairstyle.width-800.jpg',
      ),
    ),
    ChatMessageViewModel(
      id: '14',
      time: DateTime.now().subtract(const Duration(minutes: 3)),
      message: 'I\'m doing well!',
      type: MessageType.text,
      isOwnerMessage: false,
      isArrived: true,
      isSeen: true,
      sender: const UserInfoViewModel(
        firstName: 'Jane',
        lastName: 'Smith',
        imageUrl:
            'https://i.pinimg.com/474x/ee/79/3d/ee793dfb2085b85ce187909013a43816.jpg',
      ),
    ),
    ChatMessageViewModel(
      id: '15',
      time: DateTime.now().subtract(const Duration(minutes: 2)),
      message: 'That\'s great!',
      type: MessageType.text,
      isOwnerMessage: true,
      isArrived: true,
      isSeen: true,
      sender: const UserInfoViewModel(
        firstName: 'Tony',
        lastName: 'Stark',
        imageUrl:
            'https://wellgroomedgentleman.com/wp-content/uploads/2023/10/Tony_Stark_Beard_with_Quiff_Hairstyle.width-800.jpg',
      ),
    ),
  ],
);
