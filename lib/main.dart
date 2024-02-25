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
  StreamController<String> streamController = StreamController();               //getting the instance of StreamController() in streamController
  TextEditingController textEditingController = TextEditingController();        // used to control the text input field and retrieve its value.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Stream Controller"),
        ),
        body: Center(
            child: Column(
                                                                     //column display its children in a vertical arrangement
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(                                  //The StreamBuilder listens to changes in the data stream and updates the UI accordingly, showing                                                                  
                  if (snapshot.hasData) {                           //"No data" if there's nothing entered yet or displaying the entered name.
                stream: streamController.stream, 
                builder: (context, snapshot) {
                    String output = snapshot.data.toString();
                    return Text(output,
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
            SizedBox(height: 40.0),                                         //space between the textbox and the button
            ElevatedButton(
                onPressed: () {
                  String text = textEditingController.text;
                  streamController
                      .add(text);                                            //this will add the text in the "no data" part
                },
                child: Text("submit"))
          ],
        )),
      ),
    );
  }
}

/* creates with a text input field and a submit button.
When we enter our name in the input field and press "submit," our name gets displayed 
on the screen. This is done using a StreamController, which manages the data flow in the app.
The StreamBuilder listens to changes in the data stream and updates the UI accordingly, showing 
"No data" if there's nothing entered yet or displaying the entered name.*/






