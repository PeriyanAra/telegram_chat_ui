import 'package:flutter/material.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/widgets/chat_bottom_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ChatBottomField(),
        ],
      ),
    );
  }
}
