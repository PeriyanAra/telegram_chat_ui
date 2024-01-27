import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_app_foundation/presentation/common/app_back_button.dart';

class ChatScreenAppBar extends StatelessWidget {
  const ChatScreenAppBar({
    super.key,
    required this.userName,
    required this.seenMessage,
    required this.imagePath,
  });

  final String userName;
  final String seenMessage;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50,
      titleSpacing: 0,
      backgroundColor: const Color.fromARGB(255, 24, 130, 207),
      leading: const AppBackButton(),
      title: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Material(
              elevation: 5.0,
              shape: const CircleBorder(),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                backgroundImage: FileImage(File(imagePath)),
                child: Text(
                  userName.split('').first,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  seenMessage,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.call,
            color: Colors.white,
            size: 18,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
          ),
        ),
      ],
      actionsIconTheme: const IconThemeData(
        color: Colors.white,
        size: 18,
      ),
    );
  }
}
