import 'dart:convert';

//ddimport 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

// get Quotes
Future<List> getQuotes() async {
  var baseurl = "http://localhost:8080/api/v1/quotes";
  var response = await http.get(Uri.parse(baseurl));
  final data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    print(data);
    return data;
  } else {
    print("Error geting data");
  }
  return [];
}

// post Quotes
Future addQuote(Map<String, dynamic> body) async {
  var baseurl = "http://localhost:8080/api/v1/quotes";
  var encodedBody = jsonEncode(body);
  var headers = {'Content-Type': 'application/json'};
  var response = await http
      .post(Uri.parse(baseurl), headers: headers, body: encodedBody)
      .catchError((e) {
    print("Error Method :  $e");
  });
  print(response.body);
  if (response.statusCode >= 200) {
    print("Post Method :  ${response.body}");
    // return data;
  } else {
    print("Error geting data");
  }
}

// delete Quotes
Future deleteQuote(int id) async {
  print("deleteQuote Method  Called:  $id");

  var baseurl = "http://localhost:8080/api/v1/quotes/$id";
  var headers = {'Content-Type': 'application/json'};
  var response =
      await http.delete(Uri.parse(baseurl), headers: headers).catchError((e) {
    print("Error Method :  $e");
  });

  if (response.statusCode >= 200) {
    print("Delete Method :  ${response.body}");
    // return data;
  } else {
    print("Error geting data");
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Quotes App"),
          actions: [
            IconButton(
              onPressed: () async {
                print("refresh");
                // todo
                await getQuotes();
              },
              icon: Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () async {
                print("Add New Quote");
                // todo 1

                var testBody = {"quoteText": "Yaman", "author": "Mohmaad"};

                await addQuote(testBody);
                // getQuotes();
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Padding(
  padding: const EdgeInsets.all(8.0),
  child: FutureBuilder<List>(
    future: getQuotes(),
    builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) {
      return snapshot.hasData
          ? ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index) => Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  onLongPress: () async {
                    await deleteQuote(snapshot.data![index]['id']);
                    setState(() {});
                  },
                  contentPadding: const EdgeInsets.all(10),
                  leading: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      snapshot.data![index]['id'].toString(),
                    ),
                  ),
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      snapshot.data![index]['quoteText'].toString(),
                      style: GoogleFonts.aclonica(fontSize: 100),
                    ),
                  ),
                  subtitle: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      snapshot.data![index]['author'].toString(),
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            );
    },
  ),
),

      ),
    );
  }

  void init() async {
    await getQuotes();
  }
}
