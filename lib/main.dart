// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project/settings/counselors.dart';
import 'package:mini_project/settings/delete_account.dart';

import '../settings/account_details.dart';
import '../settings/all_users.dart';
import '../Pages/SignUp.dart';
import '../Pages/splash_screen.dart';
import '../settings/suicide_hotlines.dart';
import '../settings/terms_of_use.dart';
import '../Pages/HomePage.dart';
import 'Pages/LoginPage.dart';
import 'auth/login or signup.dart';
import './themes/lightmode.dart';
// import './themes/darkmode.dart';

void main(List<String> args) async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Consilium());
}

class Consilium extends StatelessWidget {
  Consilium({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: lightTheme,
        // darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          AuthPage.routeName: (context) => AuthPage(),
          HomePage.routeName: (context) => HomePage(),
          LoginPage.routeName: (context) => LoginPage(),
          SignUpPage.routeName: (context) => SignUpPage(),
          TermsOfUse.routeName: (context) => TermsOfUse(),
          Counselors.routeName: (context) => Counselors(),
          SuicideHotlines.routeName: (context) => SuicideHotlines(),
          AccountDetails.routeName: (context) => AccountDetails(),
          AllUsers.routeName: (context) => AllUsers(),
          DeleteAccount.routeName: (context) => DeleteAccount(),
        });
  }
}
