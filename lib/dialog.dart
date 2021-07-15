import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Dialogbox extends StatefulWidget {
  final  String? title;

  Dialogbox({this.title});

  @override
  _DialogboxState createState() => _DialogboxState();
}

class _DialogboxState extends State<Dialogbox> {
  TextEditingController textFieldController =TextEditingController();

  @override
  void initState() {
    super.initState();
    TextEditingController(text: widget.title);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AlertDialog(
            title: Column(
              children:<Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText('Add an Item to the List',textStyle: TextStyle(color: Colors.blue[700],fontSize:18,))
                    ],
                  ),
                ),
                TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: textFieldController,
                  decoration: InputDecoration(
                    hintText: 'Enter Text',
                  ),
                  onEditingComplete: ()=> addnewtitle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void addnewtitle(){
    if(textFieldController.text.isNotEmpty)
      Navigator.of(context).pop(textFieldController.text);
  }
}
