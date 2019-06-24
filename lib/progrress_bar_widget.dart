import 'package:flare_flutter/flare_actor_json.dart';
import 'package:flutter/material.dart';
import 'animation.dart';

class ProgressBarWidget extends StatelessWidget {
  final int background = 0xF4000000;
  final String animation = 'change_size';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(background),
      alignment: Alignment.center,
      child: Container(
        width: 60,
        height: 60,
        child: FlareActor(image, animation: animation),
      ),
    );
  }
}