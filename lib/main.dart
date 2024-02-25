import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;          //allows http requests to a server

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: ' Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String responseBody = ''; // Global Variable to store response body

  postData() async {
    var response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts/"),  //local variable      //is a fake online REST API that allows you to test different HTTP methods, 
    );                                                                                                              //including POST requests, without actually sending data to a real server.
      body: {"id": 1.toString(), "name": "smily", "email": "smily@gmail.com"},
    setState(() {
      responseBody = response.body;                                                                                 // Update response body variable
    });
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Response Body:', style: TextStyle(fontSize: 25)),
            SizedBox(height: 10),
            Text(responseBody), // Display response body
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: postData,
        child: const Icon(Icons.data_array),
      ),
    );
  }
}
