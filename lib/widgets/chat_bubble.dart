import 'package:flutter/material.dart';

class ChatStyle extends StatelessWidget {
  final Color bubcolor;
  final String message;

  const ChatStyle({
    required this.bubcolor,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: bubcolor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(message, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16),),
      ),
    );
  }
}