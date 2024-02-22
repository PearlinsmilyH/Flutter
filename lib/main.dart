import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<String> streamController = StreamController();           //this instance can emit events of type String
  TextEditingController textEditingController = TextEditingController();    // used to control the text input field and retrieve its value.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Stream Controller"),
        ),
        body: Center(
            child: Column(                                  //column display its children in a vertical arrangement
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String output = snapshot.data.toString();
                    return Text(output.toUpperCase(),                //displays the name in uppercase
                        style: TextStyle(fontSize: 15));
                  } else {
                    return Text("No data", style: TextStyle(fontSize: 24));
                  }
                }),
            SizedBox(height: 40.0),
            SizedBox(
                width: 200,
                child: TextField(
                   controller: textEditingController,
                    decoration: InputDecoration(
                        hintText: "Enter your name",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))))),
            SizedBox(height: 40.0),        //space between the textbox and the button
            ElevatedButton(
                onPressed: () {
                  String text = textEditingController.text;
                  streamController.add(text);                      //this will add the text in the "no data" part
                },
                child: Text("submit"))
          ],
        )),
      ),
    );
  }
}
