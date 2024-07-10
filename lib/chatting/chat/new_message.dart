import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';

  void _sendMessage() {
    Focus.of(context).unfocus();

    FirebaseFirestore.instance.collection('chat').add({
      'text': _userEnterMessage,
      'time': Timestamp.now(),
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Send a message...'),
            controller: _controller,
            onChanged: (value) {
              setState(() {
                _userEnterMessage = value;
              });
            },
          ),
          IconButton(
            onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
            icon: const Icon(Icons.send),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
