import 'package:flutter/material.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatefulWidget {
  @override
  ToDoAppState createState() => new ToDoAppState();
}

class ToDoAppState extends State<ToDoApp>{
  TextEditingController eCtrl = new TextEditingController();
  String value="";
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:new Scaffold(
      appBar: new AppBar( title: new Text("ToDo: ")),
      body: new Column
        (
          children: <Widget>[
            new TextField
              (
              controller: eCtrl,
              decoration: new InputDecoration.collapsed(hintText: "Add an activity for the ToDoList"),
              onChanged: (String text){
                setState((){
                  //value = text;
                });
              },
              onSubmitted: (String text){
                setState((){
                  value = eCtrl.text;
                });
                eCtrl.clear();
            },

            ),
            new Text("\n\n $value")

          ]
      )
      )
    );
  }
}
