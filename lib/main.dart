import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Container"),
            backgroundColor: Colors.blue,
          ),
          body: Container(
            padding: EdgeInsets.all(75),                             //space inside the container
           margin: EdgeInsets.all(100),                              //space outside the container 
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 9),
              //borderRadius: BorderRadius.circular(8),
              boxShadow: [
                new BoxShadow(
                  color: Colors.purple,
                  offset: new Offset(9.0, 9.0),
                ),
              ],
            ),
            child: Text("Hello!", style: TextStyle(fontSize: 50)),
          )),
    );
  }
}
