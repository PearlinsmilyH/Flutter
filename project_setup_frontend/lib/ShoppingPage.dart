import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(

        child: Text(
          'Welcome to the Shopping Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
void _navigateToShoppingPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => ShoppingPage()),
  );
}
