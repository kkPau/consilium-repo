import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LikedButton extends StatelessWidget {
  bool isLiked;
  void Function()? toggle;
  LikedButton({super.key, required this.isLiked, required this.toggle});

  @override
  Widget build(BuildContext context) {
    
    return IconButton(
       icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
      color: isLiked ? Colors.red : Colors.grey[600],
      onPressed: toggle,
    );
  }
}