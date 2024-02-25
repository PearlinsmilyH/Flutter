import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("Rows and Column"), backgroundColor: Colors.purple),
        body:
        Row(                                                                              // A row widget is used to arrange child widgets horizontally in a row
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,                               //A column widget is used to arrange child widgets vertically in a column
          children:<Widget>
          [   
            Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.red),
          child: Text(
            "Pearlin",
            style: TextStyle(color:Colors.white, fontSize: 25),
          )
           ),
           Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.red),
          child: Text(
            "Smily",
            style: TextStyle(color:Colors.white, fontSize: 25),
          )
           ) ,
           Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.red),
          child: Text(
            "Nellai",
            style: TextStyle(color:Colors.white, fontSize: 25),
          ),
           ),  
          ] 
      ),
       
      ),
    );
  }  
}  
