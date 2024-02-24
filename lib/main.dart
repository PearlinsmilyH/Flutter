import 'package:flutter/material.dart';
import 'first_page.dart';
import 'package:routes/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "routes",
        // home: SecondPage(),
        //named routes:
        // initialRoute: "/",
        // routes: {
        //   "/": (context) => const FirstPage(),
        //   "/second": (context) => const SecondPage()
        // },
        onGenerateRoute: (RouteSettings routeSettings) {
          switch (routeSettings.name) {
            case "/":                                                                  
              return MaterialPageRoute(builder: (context) => const FirstPage());        //When ("/") route is requested,FirstPage will be displayed.       
            case "/second":
              return MaterialPageRoute(builder: (context) => const SecondPage());      //when the "/second" route is requested, SecondPage will be displayed.


          }
        });
  }
}
