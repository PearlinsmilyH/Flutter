import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Load environmental variables from the .env file
  await dotenv.load(fileName: ".env");

  // Run the Flutter application
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access environmental variables
    String? apiKey = dotenv.env['API_KEY'];
    String? baseUrl = dotenv.env['BASE_URL'];

    return MaterialApp(
      title: 'Flutter Environmental Variables Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Environmental Variables Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'API Key: $apiKey',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Base URL: $baseUrl',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
