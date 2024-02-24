import 'package:flutter/material.dart';
import 'package:routes/main.dart';

void main() {
  runApp(FirstPage());
}

class FirstPage extends StatefulWidget {

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("Go to next page"),
        onPressed: () {
          Navigator.of(context).pushNamed("/second");                      //navigate to next page
        },
      )),
    );
  }
}

class SecondPage extends StatefulWidget {

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page"), backgroundColor: Colors.blue),
      body: Center(
          child: ElevatedButton(
        child: Text("Go to previous page"),
        onPressed: () {
          Navigator.pop(context);                                         //navigate to previous page
        },
      )),
    );
  }
}
