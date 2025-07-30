import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  final String text;
  const TopicCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xffcfe2ff),
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
