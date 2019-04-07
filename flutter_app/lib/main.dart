import 'package:flutter/material.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatefulWidget {
  @override
  ToDoAppState createState() => new ToDoAppState();
}

class ToDoAppState extends State<ToDoApp>{
  TextEditingController eCtrl = new TextEditingController();
  bool showDialog = false;
  List<String>textList = [];
  List<bool>textCheckBox = [];

  Widget build(BuildContext context){
    return new MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:new Scaffold(
      appBar: new AppBar(
        title: new Text("ToDo: "),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: (){
              setState((){
                showDialog = true;
              });
            },
          ),
          new IconButton(
            icon: new Icon(Icons.remove),
            onPressed: (){
              int counter = 0;
              while(counter <textList.length){
                if(textCheckBox[counter]==true){
                  textCheckBox.removeAt(counter);
                  textList.removeAt(counter);
                  counter=0;
                }else{
                  counter++;
                }
              }
              setState((){
              });
            },
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Text("This is what you need to do today"),
          showDialog == true?
              new AlertDialog(
                title: new Text("Add new ToDo item"),
                content: new TextField(
                  controller: eCtrl,
                  decoration: new InputDecoration.collapsed(hintText: "Type here"),
                  maxLines: 3,
                  onSubmitted: (String text){

                  },
                ),
                actions: <Widget>[
                  new FlatButton (
                    onPressed: (){
                      setState((){
                        showDialog = false;
                        textList.add(eCtrl.text);
                        textCheckBox.add(false);
                        eCtrl.clear();
                      });
                    },
                      child: new Text("Ok"),
                  )
                ],
              ) : new Text(""),
          new Flexible(
            child: new ListView.builder(
              itemCount: textList.length,
              itemBuilder: (BuildContext context, int index){
                return new Row(
                  children: <Widget>[
                    new Checkbox(
                      value: textCheckBox[index],
                      onChanged:(bool newValue){
                        textCheckBox[index] = newValue;
                        setState((){});

                      }
                    ),
                    new Text(textList[index])

                  ]
                );
              },
            )
          )
        ]
      )
      )
    );
  }
}
