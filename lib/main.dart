import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
 
void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraApp(),
    );
  }
}
 
class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}
 
class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  late bool _isCameraInitialized;
 
  @override
  void initState() {
    super.initState();
    _isCameraInitialized = false;
    _initializeCamera();
  }
 
  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[0], ResolutionPreset.medium);
 
    await _controller.initialize();
 
    if (!mounted) return;
 
    setState(() {
      _isCameraInitialized = true;
    });
  }
 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 
  void _capturePhoto() async {
    try {
      if (_controller.value.isInitialized) {
        XFile file = await _controller.takePicture();
        // Do something with the captured photo file (e.g., display it)
        print('Photo captured: ${file.path}');
      }
    } catch (e) {
      print('Error capturing photo: $e');
    }
  }
 
  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return Container(); // Placeholder or loading indicator while initializing
    }
 
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera App'),
      ),
      body: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: CameraPreview(_controller),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _capturePhoto,
        child: Icon(Icons.camera),
      ),
    );
  }
}