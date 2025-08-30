//! screen >> center image
//! init >> delay 3 sec >> to home page >> login page

import 'package:flutter/material.dart';
import 'package:flutter_local_storage_ex/home.dart';
import 'package:flutter_local_storage_ex/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init() async {
//! delay 3 sec
    Future.delayed(const Duration(seconds: 3), () async {
      //! get name local

      final prefs = await SharedPreferences.getInstance();

      String? name = prefs.getString('name');
      if (name != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
