// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stories/storypage.dart';
import 'package:stories/utls/storycircles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StroyPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stories"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return StoryCircle(
                      function: _openStory,
                    );
                  }),
            )
          ],
        ));
  }
}
