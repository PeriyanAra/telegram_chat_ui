import 'package:flutter/material.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/widgets/chat_text_field.dart';
import 'package:flutter_mobile_app_foundation/theming/index.dart';

class ChatBottomField extends StatefulWidget {
  const ChatBottomField({
    super.key,
    required this.onFileIconTap,
    required this.onStickerIconTap,
    required this.onEmojiIconTap,
    required this.onVoiceIconTap,
    required this.onSendIconTap,
  });

  final VoidCallback onFileIconTap;
  final VoidCallback onStickerIconTap;
  final VoidCallback onEmojiIconTap;
  final VoidCallback onVoiceIconTap;
  final VoidCallback onSendIconTap;

  @override
  State<ChatBottomField> createState() => _ChatBottomFieldState();
}

class _ChatBottomFieldState extends State<ChatBottomField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      padding: EdgeInsets.fromLTRB(
        0,
        6.0,
        0,
        mediaQuery.padding.bottom == 0 ? 24.0 : mediaQuery.padding.bottom,
      ),
      decoration: BoxDecoration(
        color: white30,
        border: Border(
          top: BorderSide(
            color: grey.withOpacity(.5),
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: const Icon(
                Icons.attach_file,
                color: grey,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: ChatTextField(
                textEditingController: _controller,
                onEmojiIconTap: widget.onEmojiIconTap,
                onStickerIconTap: widget.onStickerIconTap,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            _controller.value.text.isNotEmpty
                ? GestureDetector(
                    onTap: widget.onSendIconTap,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: blue,
                        ),
                        child: const Icon(
                          Icons.arrow_upward,
                          color: white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: widget.onVoiceIconTap,
                    child: const Icon(
                      Icons.mic_none_outlined,
                      color: grey,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
