import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Pages/ChatPage.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        title: Row(
          children: [
            Icon(
              Icons.chat,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Chats',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chatusers').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                ...snapshot.data!.docs
                    .map<Widget>((doc) => _buildUserListItem(doc, context))
                    .toList()
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return SpinKitPianoWave(
            color: Colors.black,
          );
        });
  }

  Widget _buildUserListItem(DocumentSnapshot document, context) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (FirebaseAuth.instance.currentUser!.email !=
        data['email'].toString().toLowerCase()) {
      return Container(
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(
            Icons.person,
            size: 30,
          ),
          title: Text(
            data['email'],
            style: TextStyle(color: Colors.black),
          ),
          onTap: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ChatPage(
                receiverEmail: data['email'], receiverId: data['uid']);
          })),
        ),
      );
    } else {
      return Container();
    }
  }
}
