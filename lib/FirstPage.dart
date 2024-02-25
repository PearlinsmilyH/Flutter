import 'package:appstate/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);           //accessing the Counter instance provided by the ChangeNotifierProvider using the Provider.of<Counter>(context)

    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Count: ${counter.count}'),
            ElevatedButton(
              onPressed: () => counter.increment(),
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () => counter.decrement(),
              child: Text('Decrement'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/second'),
              child: Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
