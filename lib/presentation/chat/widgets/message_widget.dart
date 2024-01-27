import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.isMy,
    required this.message,
    this.time = '',
    this.isUserSaw = false,
  });

  final bool isMy;
  final String message;
  final bool isUserSaw;
  final String time;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: isMy ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth / 1.5,
            minHeight: 20,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              var containerHeight = constraints.minHeight + message.length - 20;

              return Container(
                alignment: Alignment.center,
                height: containerHeight,
                margin: isMy
                    ? const EdgeInsets.only(
                        right: 10,
                      )
                    : const EdgeInsets.only(
                        left: 10,
                      ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color:
                      isMy ? const Color.fromARGB(255, 181, 199, 161) : Colors.white,
                ),
                child: Flexible(child: Text(message)),
              );
            },
          ),
        ),
      ),
    );
  }
}
