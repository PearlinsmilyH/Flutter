import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
                                                                                  // Define a custom InheritedWidget
class MyInheritedWidget extends InheritedWidget {
  final int data;

  MyInheritedWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);                                            // Helper method to access the inherited widget from any descendant widget
                                                                                  // This is a static method that provides a convenient way to access the inherited data within the widget tree. 
                                                                                  // It uses the dependOnInheritedWidgetOfExactType method of the BuildContext to retrieve the nearest ancestor MyInheritedWidget instance.
  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }                                                                                // This method is called whenever the inherited data changes. It compares the old and 
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {                            // new data to determine whether the widget's descendants should be notified of the change
    return oldWidget.data != data;
  }
}
class MyWidget extends StatelessWidget {                                           // Widget that consumes the inherited data
  @override
  Widget build(BuildContext context) {
    final inheritedData = MyInheritedWidget.of(context).data;                      // Access the inherited data using MyInheritedWidget.of(context)
    return Text(
      'Inherited Data: $inheritedData',
      style: TextStyle(fontSize: 40),
    );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widget',
      home: MyInheritedWidget(
        data: 40, // Data to be inherited
        child: Scaffold(
          appBar: AppBar(
            title: Text('Inherited Widget'),
            backgroundColor: Colors.blue,
          ),
          body: Center(
            child: MyWidget(),                                                     // Widget that consumes the inherited data
          ),
        ),
      ),
    );
  }
}
