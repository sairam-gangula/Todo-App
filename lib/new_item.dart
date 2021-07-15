import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class NewItemView extends StatefulWidget {
  final String? title;

  NewItemView({this.title});


  @override
  _NewItemViewState createState() => _NewItemViewState();
}

class _NewItemViewState extends State<NewItemView> {

   TextEditingController textFieldController =TextEditingController();

  @override
  void initState() {
    super.initState();
    TextEditingController(text: widget.title);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText('Add an Item to the List',textStyle: TextStyle(color: Colors.teal[700],fontSize:18,))
                ],
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: textFieldController,
              decoration: InputDecoration(
                hintText: 'Enter Text',
              ),
              onEditingComplete: ()=> addnewtitle(),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () => addnewtitle(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Add Item',style: TextStyle(fontSize:18,fontWeight: FontWeight.normal),),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color:Colors.teal),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addnewtitle(){
    if(textFieldController.text.isNotEmpty)
      Navigator.of(context).pop(textFieldController.text);
  }

}

