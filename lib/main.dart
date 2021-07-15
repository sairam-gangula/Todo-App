import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/screentitle.dart';

import 'new_item.dart';


void main() => runApp(MaterialApp(
      home: Home(),

    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Todo> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Column(

             children: <Widget>[
               SizedBox(
                 height: 120,
                 child: ScreenTitle('Todo List'),
               ),
             ],
            ),
          Expanded(
            child:Container(
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0,25.0,10.0,2),
                child: list.isNotEmpty ?buildBody() :buildEmptyBody(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:FloatingActionButton.extended(
        onPressed: () => goToNewItemView(),
        label: Text('Add Todo',style: TextStyle(fontSize: 16,),),
        icon: Icon(Icons.playlist_add_outlined),
        backgroundColor: Colors.teal[700],
      ),
    );
  }
  Widget buildBody(){
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index){
        return buildItem(list[index]);
      },
    );
  }

  Widget buildEmptyBody(){
    return Center(
      child: Text('Woohoo, nothing due soon!',style: TextStyle(color:Colors.grey,fontStyle: FontStyle.italic,fontSize: 18),),
    );
  }

  Widget buildItem(Todo item){
    return Dismissible(
      key:Key(item.hashCode.toString()),
      onDismissed: (DismissDirection direction) => removeItem(item),
      direction: DismissDirection.startToEnd,
      background: Container(
        decoration: BoxDecoration(color: Colors.teal[600],borderRadius: BorderRadius.only(topLeft:Radius.circular(20) , bottomLeft: Radius.circular(20))),
        padding : EdgeInsets.only(left: 12.0),
        child: Icon(Icons.delete_outline , color: Colors.white),
          alignment: Alignment.centerLeft,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight:Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20), )),
        shadowColor: Colors.teal[900],
        child: CheckboxListTile(
          title: Text(
            item.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal[700],)

          ),
          contentPadding: EdgeInsets.fromLTRB(20.0,0,20.0,0),
          value: item.complete,
          onChanged: (value){
            setCompleteness(item);
            },
          activeColor: Colors.teal,
          checkColor: Colors.white,
        ),

      ),
    );
  }



  // navigation methods
  void goToNewItemView(){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return NewItemView();
        }
    )).then((title) => addTodo(Todo(title: title)) );
  }
  //Below code is Data changing methods , basically deleting 
  void setCompleteness(Todo item){
    setState(() {

      item.complete = !item.complete;

    });
  }
  void removeItem( Todo item){
    setState(() {
      list.remove(item);
    });

  }
  void addTodo(Todo item){
    setState(() {
      list.add(item);
    });
  }
}

class Todo{

  String title;

  bool complete;
  Todo({required this.title  , this.complete = false,});

}



//https://www.youtube.com/watch?v=YyE4xHMA63Y
//watch this yt channel for the tutorial