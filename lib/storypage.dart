// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stories/strories/story1.dart';
import 'package:stories/strories/story2.dart';
import 'package:stories/strories/story3.dart';
import 'package:stories/utls/progressbar.dart';
import 'package:stories/utls/storybars.dart';

class StroyPage extends StatefulWidget {
  const StroyPage({Key? key}) : super(key: key);

  @override
  State<StroyPage> createState() => _StroyPageState();
}

class _StroyPageState extends State<StroyPage> {
  int currentStoryIndex = 0;
  final List<Widget> myStories = [
    MyStory1(),
    MyStory2(),
    MyStory3(),
  ];

  List<double> percentWatched = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < myStories.length; i++) {
      percentWatched.add(0);
    }
    _startWatching();
  }

  void _startWatching() {
    Timer.periodic(Duration(microseconds: 50), (timer) {
      setState(() {
        // only add 0.01 if prcentsge is < 0.1
        if (percentWatched[currentStoryIndex] + 0.01 < 1) {
          percentWatched[currentStoryIndex] += 0.01;
          //  if adding 0.01, cancel timer
        } else {
          percentWatched[currentStoryIndex] = 1;
          timer.cancel();
          // go to the next story
          if (currentStoryIndex < myStories.length - 1) {
            currentStoryIndex += 1;
            _startWatching();
          } else {
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final dx = details.globalPosition.dx;
    if (dx < screenWidth / 1) {
      setState(
        () {
          if (currentStoryIndex > 0) {
            percentWatched[currentStoryIndex - 1] = 0;
            percentWatched[currentStoryIndex] = 0;
            currentStoryIndex -= 1;
          }
          //
        },
      );
    } else {
      setState(
        () {
          // if there are more stories left
          if (currentStoryIndex < myStories.length - 1) {
            // finish current story
            percentWatched[currentStoryIndex] = 1;
            // move to the next story
            currentStoryIndex += 1;
            // if user is on last stroy
          } else {
            percentWatched[currentStoryIndex] = 1;
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
            myStories[currentStoryIndex],
            StoryBars(
              percentWatched: percentWatched,
            ),
          ],
        ),
      ),
    );
  }
}
