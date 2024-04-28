import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdbapp/screens/home/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/movie.jpeg',
            ),
            const Text("Movie Hub" , style: TextStyle(color: Colors.green , fontSize: 25 , fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 5,
            ),
            const CupertinoActivityIndicator(color: Colors. green,)
          ],
        ),
      ),
    );

  }
}
