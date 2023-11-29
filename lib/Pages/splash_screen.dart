import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:mini_project/auth/login%20or%20signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, AuthPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         ClipRRect(
      //           borderRadius: BorderRadius.circular(200),
      //           child: Image.asset('assets/images/Consilium.jpg', height: 300, width: 300,)
      //         ),
      //         const SizedBox(height: 20,),
      //         Text('We are one big family', style: TextStyle(color: Theme.of(context).colorScheme.primary,fontFamily: 'OpenSans', fontSize: 20),),
      //         const SizedBox(height: 70),
      //         const SpinKitSpinningLines(color: Colors.deepOrange),
      //       ],
      //     ),
      //   ),
      // ),
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          'assets/images/splash.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black38,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/images/Consilium.jpg',
                      height: 100,
                      width: 100,
                    )),
                const SizedBox(height: 200),
                Text(
                  'WE ARE YOUR ONLINE FAMILY',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Quicksand'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 100),
                SpinKitSpinningLines(color: Colors.deepOrange)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
