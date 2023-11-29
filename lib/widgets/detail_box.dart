import 'package:flutter/material.dart';

class DetailsBox extends StatelessWidget {
  final String text;
  final String label;
  final void Function()? onTap;

  DetailsBox({
    required this.label,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(left: 20, bottom: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(color: Colors.grey[400]),),
              IconButton(
                onPressed: onTap,
                icon: Icon(Icons.settings, color: Colors.grey[400],)
              )
            ],
          ),
          Divider(),
          Text(text,) ,
      ]),
    );
  }
}