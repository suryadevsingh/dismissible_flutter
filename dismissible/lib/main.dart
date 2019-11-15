import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatefulWidget {
//   MyApp({Key key}) : super(key: key);
//     MyApp({Key key}) : super(key: Key);
 
  @override
  _MyAppState createState() => _MyAppState();
 
}

class _MyAppState extends State<MyApp> {
  final items = List<String>.generate(100, (i) => "item${i+1}");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Dismissible"),),
        body: ListView.builder(itemCount: items.length,
            itemBuilder:(context,index){
          final item = items[index];
          return Dismissible(

            key: Key(item),

          onDismissed: (direction){
            setState(() {
              items.removeAt(index);
            });
            Scaffold.of(context).showSnackBar(SnackBar(content:Text("$item dismissed")));
          },    
          background: Container(color: Colors.red,
          child:Center(child: Text("delete it")) ,
          ),

            secondaryBackground: Container(
              color: Colors.lightGreenAccent,
            child: Icon(Icons.thumb_up),
            ),
            child: ListTile(title: Text("$item"),),
          );
            }),
      ),
    );
  }
}

