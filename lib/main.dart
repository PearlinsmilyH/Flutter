import 'package:appstate/FirstPage.dart';
import 'package:appstate/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class Counter with ChangeNotifier {                               //ChangeNotifier notify its listeners when its state changes
  int _count = 0;

  int get count => _count;                                        //public getter method "count" that allows external classes to access the current count value

  void increment() {
    _count++;
    notifyListeners();                                           //This notifies any listeners that are dependent on the count value that the state has changed, 
  }                                                              //ask them to rebuild and reflect the updated count value in other pages.

  void decrement() {
    _count--;
    notifyListeners();
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(                              //listen to changes and update accordingly when changes occur.
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
