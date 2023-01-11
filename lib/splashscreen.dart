import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_contact/FirstPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  addValue() async {
    SharedPreferences refs = await SharedPreferences.getInstance();
    refs.setInt("dataLength", 334);
  }

  @override
  void initState() {
    addValue();
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FirstPage(),
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/Contact.gif'),
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
            borderRadius: BorderRadius.circular(200),
            border: Border.all(
              width: 3,
              color: Colors.cyan.shade500,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.shade600,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 50.0,
                spreadRadius: 3.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.indigo.shade900,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
        ),
      ),
    );
  }
}
