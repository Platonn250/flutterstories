// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final function;
  const StoryCircle({Key? key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          height: 60,
          width: 60,
        ),
      ),
    );
  }
}
