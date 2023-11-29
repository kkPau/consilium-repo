import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Pages/HomePage.dart';
import '../Pages/LoginPage.dart';

class AuthPage extends StatelessWidget {
  static const routeName = '/auth-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return HomePage();
          }
          else{
            return LoginPage();
          }
        }
      ),
    );
  }
}