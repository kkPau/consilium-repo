// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/Pages/CommentPage.dart';
import 'package:mini_project/widgets/com_num.dart';

import '../widgets/like_button.dart';

class WallPost extends StatefulWidget with ChangeNotifier {
  final String message;
  final String user;
  final String postId;
  final String time;
  final List<String> likes;

  WallPost({
    required this.message,
    required this.user,
    required this.postId,
    required this.likes,
    required this.time,
  });

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {
  final currentUser = FirebaseAuth.instance.currentUser;

  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser!.email);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    DocumentReference postRef =
        FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);

    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser!.email])
      });
    } else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser!.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String comEmail = widget.user;
    final String comMessage = widget.message;
    final String comLikes = widget.likes.length.toString();
    final String compostId = widget.postId;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return CommentPage(
            comEmail: comEmail,
            comMessage: comMessage,
            comLikes: comLikes,
            compostId: compostId,
          );
        }),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          // color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 90,
                child: Text(widget.message,
                    softWrap: false,
                    style: TextStyle(fontSize: 15),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.time,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LikedButton(isLiked: isLiked, toggle: toggleLike),
                      Text(
                        widget.likes.length.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return CommentPage(
                                  comEmail: comEmail,
                                  comMessage: comMessage,
                                  comLikes: comLikes,
                                  compostId: compostId,
                                );
                              }),
                            );
                          },
                          icon: Icon(
                            Icons.comment_outlined,
                            color: Colors.grey[600],
                          )),
                      ComNum(postId: widget.postId),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
