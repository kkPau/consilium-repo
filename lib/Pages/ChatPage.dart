import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mini_project/auth/chat_auth.dart';
import 'package:mini_project/widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverId;
  const ChatPage({
    required this.receiverEmail,
    required this.receiverId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messageController = TextEditingController();
  final ChatAuth _chatAuth = ChatAuth();

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await _chatAuth.sendMessage(widget.receiverId, messageController.text);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              autofocus: true,
              maxLines: null,
              controller: messageController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary),
                ),
                fillColor: Colors.grey[300],
                filled: true,
                hintText: 'Send a message',
              ),
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.send,
              size: 30,
            ),
          )
        ],
      ),
    );
  }

  // Future<void> deleteMessage() async{
  //   try{
  //     await FirebaseFirestore.instance.collection('chatusers').doc()
  //   }
  // }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == FirebaseAuth.instance.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      child: Container(
        alignment: alignment,
        child: Column(
            crossAxisAlignment:
                (data['senderId'] == FirebaseAuth.instance.currentUser!.uid)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            children: [
              Text(
                data['senderEmail'],
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(
                height: 4,
              ),
              ChatStyle(
                bubcolor:
                    (data['senderId'] == FirebaseAuth.instance.currentUser!.uid)
                        ? Colors.blue
                        : Colors.black,
                message: data['message'],
              ),
            ]),
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatAuth.getMessages(
            widget.receiverId, FirebaseAuth.instance.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs
                  .map((doc) => _buildMessageItem(doc))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return AlertDialog(
              title: Text('Uh oh'),
              content: Text('An error occurred'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Oaky',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ))
              ],
            );
          }
          return Center(
            child: SpinKitPianoWave(
              color: Colors.black,
            ),
          );
        });
  }
}
