import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget(
      {Key? key, required this.child, required this.message})
      : super(key: key, child: child);

  final Widget child;
  final String message;

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.message != message;
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inherited"),
        backgroundColor: Colors.blue,
      ),
      body: MyInheritedWidget(
        // passing the message as string
        message: "Hai",
        child: Builder(
          builder: (BuildContext innerContext) {
            return Center(
                child: Text(
              // using the message of our inherited widget using of()
              MyInheritedWidget.of(innerContext).message,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ));
          },
        ),
      ),
    );
  }
}
