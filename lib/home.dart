//! get name center helloe

import 'package:flutter/material.dart';
import 'package:flutter_local_storage_ex/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //!
  Future<String?> getNameFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  String? name;
  bool isLoading = true;
  @override
  void initState() {
    getNameFromLocal().then((value) {
      setState(() {
        name = value;
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Hello!',
                        style: TextStyle(
                          fontFamily: 'itim',
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        name ?? 'User',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'itim',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            //!
                            final prefs = await SharedPreferences.getInstance();

                            prefs.remove('name');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'itim',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ))
                    ],
                  )));
  }
}
