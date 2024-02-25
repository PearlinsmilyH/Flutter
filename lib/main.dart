import 'package:flutter/material.dart';

void main() {                                                 //the "main()" function initializes the application by calling "runApp()"  with the root widget "MyApp"
  runApp(MyApp());
}

class MyApp extends StatelessWidget {                        //indicating that this widget doesn't have any mutable state
  @override
  Widget build(BuildContext context) {                       //used for accessing inherited widgets
    const title = 'Basic List';

    return MaterialApp(                                       //MaterialApp is a widget that represents the root of your application
                                                              //MaterialApp sets up various configurations for your app
      title: title,
      home: Scaffold(
        appBar: AppBar(                                       
          title: const Text(
            title,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: const <Widget>[                                  //that accept multiple child widgets
            ListTile(
              leading: Icon(Icons.email),
              title: Text('email'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
            ListTile(leading: Icon(Icons.settings), title: Text('settings')),
          ],
        ),
      ),
    );
  }
}
