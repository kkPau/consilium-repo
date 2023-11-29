import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mini_project/helper/helpers.dart';
import 'package:mini_project/widgets/com_num.dart';

import '../widgets/comment_item.dart';

class CommentPage extends StatefulWidget {
  final String comEmail;
  final String comMessage;
  final String comLikes;
  final String compostId;

  const CommentPage({
    required this.comEmail,
    required this.comMessage,
    required this.comLikes,
    required this.compostId,
  });

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final comController = TextEditingController();

  void addComment(String commentText) {
    FirebaseFirestore.instance
        .collection('User Posts')
        .doc(widget.compostId)
        .collection('Comments')
        .add({
      'CommentText': commentText,
      'CommentBy': FirebaseAuth.instance.currentUser!.email,
      'CommentTime': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Row(
            children: [
              Text('Interact on post'),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.comEmail}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('${widget.comMessage}'),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${widget.comLikes}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              ' Likes',
                            )
                          ],
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            ComNum(postId: widget.compostId),
                            Text(
                              ' Comments',
                            )
                          ],
                        )
                      ],
                    ),
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('User Posts')
                      .doc(widget.compostId)
                      .collection('Comments')
                      .orderBy('CommentTime')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        children: [
                          ...snapshot.data!.docs.map((doc) {
                            final commentData =
                                doc.data() as Map<String, dynamic>;
                            return CommentItem(
                              comment: commentData['CommentText'],
                              user: commentData['CommentBy'],
                              time: formatDate(commentData['CommentTime']),
                            );
                          }),
                        ],
                      );
                    } else if (!snapshot.hasData) {
                      return SpinKitPianoWave(
                        color: Colors.black,
                      );
                    } else if (snapshot.hasError) {}
                    return Text(
                      'No Comments Yet! Add one',
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      cursorColor: Colors.black,
                      autofocus: true,
                      controller: comController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        fillColor: Colors.grey[300],
                        filled: true,
                        hintText: 'Add a comment',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: IconButton(
                      onPressed: () {
                        addComment(comController.text);
                        comController.text = '';
                      },
                      icon: Icon(
                        Icons.arrow_circle_up,
                        size: 50,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
