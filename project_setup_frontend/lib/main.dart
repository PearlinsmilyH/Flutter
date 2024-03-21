import 'package:flutter/material.dart';
import './Service.dart';
import './LoginPage.dart'; // Import the LoginPage widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); // Renamed addressController to passwordController
  TextEditingController mobileController = TextEditingController();
  Service service = Service();

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text('Name'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Email'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Mobile'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: mobileController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Mobile',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Password'), // Changed "Address" to "Password"
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: passwordController, // Changed addressController to passwordController
              obscureText: true, // Hides the entered text for security
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                service.saveUser(
                  nameController.text,
                  mobileController.text,
                  emailController.text,
                  passwordController.text, // Changed addressController.text to passwordController.text
                );
                _navigateToLoginPage(context);
              },
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
