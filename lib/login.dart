//! design
//! set sharedpreferences
//! nav home

import 'package:flutter/material.dart';
import 'package:flutter_local_storage_ex/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 200,
                width: 200,
              ),
            ),
            Text(
              'login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'itim'),
            ),
            Text(
              'Welcome back with us!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'itim'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 10,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your name',
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  //! store name to local

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('name', nameController.text);
                  //! home
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));

                  // Save name to SharedPreferences and navigate to HomeScreen
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'itim'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
