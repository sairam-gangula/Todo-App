import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
/*late String text;
class ScreenTitle{
  late String text;
  ScreenTitle(this.text);
}*/

class ScreenTitle extends StatelessWidget {
  final String text;
  ScreenTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0,30.0,0,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:<Widget>[
          DefaultTextStyle(
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 35.0,
              letterSpacing: 1.0,
              color: Colors.white,

            ),
            child: AnimatedTextKit(
               repeatForever: false,
               totalRepeatCount: 4,
               animatedTexts: [
                 TyperAnimatedText(text),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
