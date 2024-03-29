import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hidroponik/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_hidroponik/page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate ? 0 : -30,
              left: animate ? 0 : -30,
              child: const Image(
                image: AssetImage('assets/img/shape.png'),
                width: 80,
                height: 80,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left: animate ? 30.0 : -80,
              child: AnimatedOpacity(
                opacity: animate ? 1 : 0,
                duration: const Duration(milliseconds: 1600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Smart Farming',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF285244),
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      'Monitoring your plant',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[400],
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: animate ? 150 : 0,
              child: AnimatedOpacity(
                opacity: animate ? 1 : 0,
                duration: const Duration(milliseconds: 2000),
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: AssetImage('assets/img/people.png'),
                    width: 400,
                    height: 400,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2000),
              bottom: animate ? 60 : 0,
              right: 30.0,
              child: AnimatedOpacity(
                opacity: animate ? 1 : 0,
                duration: const Duration(milliseconds: 2000),
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xFF78B2A4),
                  ),
                ),
              ),
            )
          ],
  
        ),
      ),
    );
  }

  Future startAnimation() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    final String? token = prefs.getString('token');

    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => animate = true);
    if (token == null) {
      await Future.delayed(const Duration(milliseconds: 5000));
      if (context.mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 5000));
      if (context.mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }
  }
}
