import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controller Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define a TextEditingController to manage the state of the input field
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller Example'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller:
                  _textController, // Assign the controller to the TextField
              decoration: InputDecoration(
                  hintText: "Name",
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(height: 20.0), //to create space
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Details'),
                      content: Text(_textController.text,
                          style: TextStyle(fontSize: 32)),
                      actions: <Widget>[
                        TextButton(
                            child: Text('Okay'),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _textController.dispose();
    super.dispose();
  }
}
