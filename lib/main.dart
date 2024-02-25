//Import images from local files by creating assets , to add assets to our appln.
//  add assets section in pubspec.yaml, a list of images displayed by fetched from the 
// imagePaths list using ListView.builder, with each image wrapped in a ListTile widget
// inside an Expanded widget to ensure proper layout.


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image ListView',
      home: ImageListView(),
    );
  }
}

class ImageListView extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/pinkflower.jpg',
    'assets/redflower.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image ListView'),
      ),
      body: ListView.builder(                                   //This widget creates a scrollable, linear array of widgets whose contents are dynamically generated using a builder function. 
                                                                //It is suitable for creating long lists.
        itemCount: imagePaths.length,
        itemBuilder: (_, index) {
          return Expanded(                                      //Expanded widget is used to make its child expand to fill the available space.
            child: ListTile(
              title: Image.asset(
                imagePaths[index],
                // width: 500,
                // height: 500,
                fit: BoxFit.cover,                              //ensures that the image covers the entire space of the ListTile.
              ),
              onTap: () {
                // Handle image tap event
                print('Tapped image ${index + 1}');
              },
            ),
          );
        },
      ),
    );
  }
}
