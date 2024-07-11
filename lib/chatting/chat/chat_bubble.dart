import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMe, {super.key});

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: const Radius.circular(15),
              topLeft: const Radius.circular(15),
              bottomRight:
                  isMe ? const Radius.circular(0) : const Radius.circular(15),
              bottomLeft:
                  isMe ? const Radius.circular(15) : const Radius.circular(0),
            ),
            color: isMe ? Colors.grey : Colors.blue,
          ),
          width: 145,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            message,
            style: TextStyle(
              color: isMe ? Colors.black : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
