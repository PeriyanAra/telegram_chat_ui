import 'package:flutter/material.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/widgets/chat_bottom_field.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/widgets/chat_screen_app_bar.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/widgets/message_widget.dart';

class TelegramChatScreen extends StatefulWidget {
  const TelegramChatScreen({super.key});

  @override
  State<TelegramChatScreen> createState() => _TelegramChatScreenState();
}

class _TelegramChatScreenState extends State<TelegramChatScreen> {
  late GlobalKey key;

  @override
  void initState() {
    super.initState();
    key = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: ChatScreenAppBar(
              userName: 'Narek',
              seenMessage: 'last seen recently',
              imagePath: ''),
        ),
        bottomSheet: ChatBottomField(
          onFileIconTap: () {},
          onStickerIconTap: () {},
          onEmojiIconTap: () {},
          onVoiceIconTap: () {},
          onSendIconTap: () {},
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://w0.peakpx.com/wallpaper/220/854/HD-wallpaper-whatsapp-black-abstract-abstract-digital-abstraction-abstracts-background-digital-pattern-texture.jpg',
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                child: const MessageWidget(
                  isMy: true,
                  message:
                      'Hdsacdsvcdadsgsdfgfdgdsgfgfdfgsdfgsfdsfgsgafadsagergregwfdfadsfsdfsdfaff',
                  isUserSaw: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
