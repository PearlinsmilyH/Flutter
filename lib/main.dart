import 'package:appstate/FirstPage.dart';
import 'package:appstate/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MaterialApp(
        title: 'Global State Example',
        initialRoute: '/',
        routes: {
          '/': (context) => FirstPage(),
          '/second': (context) => SecondPage(),
        },
      ),
    );
  }
}