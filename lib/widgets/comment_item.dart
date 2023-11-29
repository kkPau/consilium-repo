import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final String comment;
  final String user;
  final String time;

  CommentItem({
    required this.comment,
    required this.user,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(user, style: TextStyle(color: Colors.grey[600]),),
          const SizedBox(height: 6,),
          Text(comment),
          const SizedBox(height: 6,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(time, style: TextStyle(color: Colors.grey[600]),),
          ]),
      ]),
    );
  }
}