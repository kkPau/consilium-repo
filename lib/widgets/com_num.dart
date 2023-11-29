import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComNum extends StatelessWidget {
  final String postId;
  const ComNum({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('User Posts')
                  .doc(postId)
                  .collection('Comments')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final String commentNum =
                      snapshot.data!.docs.length.toString();
                  return Text(
                    commentNum,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  );
                }
                return Text('0');
              }),
        ],
      ),
    );
  }
}
