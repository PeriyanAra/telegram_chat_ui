import 'package:flutter/material.dart';
import 'package:flutter_mobile_app_foundation/theming/index.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
    required this.textEditingController,
    required this.onEmojiIconTap,
    required this.onStickerIconTap,
  });

  final TextEditingController textEditingController;
  final VoidCallback onStickerIconTap;
  final VoidCallback onEmojiIconTap;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final InputBorder inputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: transparent),
      borderRadius: BorderRadius.circular(20),
    );

    return TextField(
      controller: widget.textEditingController,
      maxLines: 10,
      minLines: 1,
      cursorColor: blue,
      style: const TextStyle(
        fontSize: 15.0,
        color: black,
      ),
      decoration: InputDecoration(
        filled: true,
        hintText: 'Message',
        hintStyle: const TextStyle(
          color: grey,
        ),
        isDense: true,
        fillColor: white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
        errorBorder: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        border: inputBorder,
        suffixIcon: GestureDetector(
          onTap: () {
            widget.textEditingController.value.text.isNotEmpty
                ? widget.onEmojiIconTap.call()
                : widget.onStickerIconTap.call();
          },
          child: Icon(
            widget.textEditingController.value.text.isNotEmpty
                ? Icons.emoji_emotions
                : Icons.sticky_note_2,
            color: grey,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }
}
