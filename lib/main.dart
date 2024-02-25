import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';                                 // for accessing the device's location

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Demo',
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _locationMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _getLocation();
              },
              child: Text('Get Location'),
            ),
            SizedBox(height: 16),
            Text(_locationMessage),
          ],
        ),
      ),
    );
  }

  void _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _locationMessage =
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      });
    } catch (e) {
      print(e);
    }
  }
}


/*Geolocator package to access the device's location. When the user taps the "Get Location" button, it calls the _getLocation method,
which asynchronously retrieves the current position using the getCurrentPosition method provided by Geolocator. Once the position is 
obtained, it updates the _locationMessage string with the latitude and longitude coordinates, which triggers a UI update through the
setState method, displaying the location information on the screen. If any error occurs during the location retrieval process, it is 
caught and printed to the console*/
