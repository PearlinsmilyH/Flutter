import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Define a list of items for the dropdown menu
  final List<String> items = ['Mr', 'Miss', 'Mrs'];

  // Variable to hold the currently selected value
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    // Set the initial selected value
    selectedValue = items.first;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dropdown Example'),
        ),
        body: Center(
          child: DropdownButton<String>(
            underline: Container(),
            // Define the dropdown menu items
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            // Set the initial value
            value: selectedValue,
            // Handle dropdown menu item selection
            onChanged: (String? newValue) {
              // Update the selected value and rebuild the widget
              setState(() {
                selectedValue = newValue;
              });
              // Perform actions based on the selected value
              print('Selected: $newValue');
            },
          ),
        ),
      ),
    );
  }
}
