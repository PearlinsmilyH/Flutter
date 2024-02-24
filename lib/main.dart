import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Image GridView',
      home: NetworkImageGridView(),
    );
  }
}

class NetworkImageGridView extends StatelessWidget {
  final List<String> images = [
    'https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg',
    'https://cdn.firstcry.com/education/2022/12/12101916/Flower-Names-In-English-For-Kids.jpg',
    'https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_640.jpg',
    'https://cdn.pixabay.com/photo/2014/04/14/20/11/pink-324175_640.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Image GridView'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,    //no. of images in a row
          mainAxisSpacing: 8.0, //spacing between rows
          crossAxisSpacing: 8.0, //spacing between columns
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle image tap event
              print('Tapped image ${index + 1}');
            },
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
