import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final chatDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              return Container(
                child: Text(chatDocs[index]['text']),
              );
            },
          );
        },
      ),
    );
  }
}
