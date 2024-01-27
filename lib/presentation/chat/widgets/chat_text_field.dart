import 'package:flutter/material.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  Icon _suffixIcon =
      const Icon(Icons.sticky_note_2_rounded, color: Colors.grey);

  @override
  void initState() {
    super.initState();
    widget.textEditingController.addListener(_updateSuffixIcon);
  }

  void _updateSuffixIcon() {
    final text = widget.textEditingController.text;
    final lines = '\n'.allMatches(text).length + 1;
    final newIcon = lines > 1
        ? const Icon(Icons.emoji_emotions, color: Colors.grey)
        : const Icon(Icons.sticky_note_2_rounded, color: Colors.grey);

    if (newIcon.icon != _suffixIcon.icon) {
      setState(() {
        _suffixIcon = newIcon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final InputBorder inputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    );

    return TextField(
      controller: widget.textEditingController,
      maxLines: 10,
      minLines: 1,
      cursorColor: Colors.blue,
      style: const TextStyle(
        fontSize: 15.0,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        hintText: 'Message',
        hintStyle: const TextStyle(color: Colors.grey),
        isDense: true,
        fillColor: Colors.black,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
        errorBorder: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        border: inputBorder,
        suffixIcon: _suffixIcon,
      ),
    );
  }

  @override
  void dispose() {
    widget.textEditingController.removeListener(_updateSuffixIcon);
    widget.textEditingController.dispose();
    super.dispose();
  }
}
