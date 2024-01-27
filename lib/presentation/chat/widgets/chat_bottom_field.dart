import 'package:flutter/material.dart';
import 'package:flutter_mobile_app_foundation/presentation/chat/widgets/chat_text_field.dart';

class ChatBottomField extends StatefulWidget {
  const ChatBottomField({
    super.key,
  });

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
      decoration: const BoxDecoration(
        color: Colors.black87,
        border: Border(
          top: BorderSide(color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.attach_file,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: ChatTextField(
                textEditingController: _controller,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            _controller.value.text.isNotEmpty
                ? Container(
                    height: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                  )
                : const Icon(
                    Icons.mic_none_outlined,
                    color: Colors.grey,
                  ),
          ],
        ),
      ),
    );
  }
}
