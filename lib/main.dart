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
          title: Text('LayoutBuilder Example'),
        ),
        body: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // Check if the available width is greater than 300
              if (constraints.maxWidth > 400) {
                // Return a wide container if width is greater than 300
                return Container(
                  width: 300,
                  height: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Wide Container',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              } else {
                // Return a narrow container if width is less than or equal to 300
                return Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Narrow Container',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
