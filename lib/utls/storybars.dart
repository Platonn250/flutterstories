import 'package:flutter/material.dart';
import 'package:stories/utls/progressbar.dart';

class StoryBars extends StatelessWidget {
  StoryBars({Key? key, required this.percentWatched}) : super(key: key);

  List<double> percentWatched = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 8, right: 8),
      child: Row(
        children: [
          Expanded(
            child: MyProgressBar(percentWatched: percentWatched[0]),
          ),
          Expanded(
            child: MyProgressBar(percentWatched: percentWatched[1]),
          ),
          Expanded(
            child: MyProgressBar(percentWatched: percentWatched[2]),
          ),
        ],
      ),
    );
  }
}
