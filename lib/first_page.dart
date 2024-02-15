import 'package:flutter/material.dart';
import 'package:routes/main.dart';

void main() {
  runApp(FirstPage());
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

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
        child: Text("Go to second page"),
        onPressed: () {
          Navigator.of(context).pushNamed("/second");
        },
      )),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

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
        child: Text("Go back"),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
    );
  }
}
