import 'package:connectivity_plus/connectivity_plus.dart';                              //provides functionality for checking network connectivity
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ConnectivityPage(),
    );
  }
}

class ConnectivityPage extends StatefulWidget {
  const ConnectivityPage({Key? key}) : super(key: key);

  @override
  _ConnectivityPageState createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  late String data;

  @override
  void initState() {
    super.initState();
    data = "Checking...";
    checkStatus();                                                                   // method to determine the current network status
  }

  Future<void> checkStatus() async {
    final connectivityResult = await Connectivity().checkConnectivity();             // connectivity result is obtained using Connectivity().checkConnectivity() 
    if (connectivityResult == ConnectivityResult.mobile) {                           
      data = "Mobile Network";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      data = "Wifi network";
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      data = "Ethernet network";
    } else if (connectivityResult == ConnectivityResult.vpn) {
      data = "VPN network";
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      data = "Bluetooth network";
    } else if (connectivityResult == ConnectivityResult.other) {
      data = "Other network";
    } else {
      data = "No network";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Connectivity app",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        backgroundColor: Colors.blue[900],
        toolbarHeight: 60,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Current Network status:",style: TextStyle(fontSize: 23)),
            FutureBuilder(
              future: checkStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {                /*While waiting for the future to complete (checkStatus()), a CircularProgressIndicator is shown.
                                                                                            Once the future completes, the network status is displayed using a Text widget.*/
                  
                  return CircularProgressIndicator();                                     /* displays a circular loading indicator,used to indicate that some process
                                                                                            is ongoing and the user should wait for it to complete.*/
                } else {
                  return Text(data);
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  data = "Checking...";
                  checkStatus();
                });
              },
              child: Text("Check status"),
            ),
          ],
        ),
      ),
    );
  }
}
