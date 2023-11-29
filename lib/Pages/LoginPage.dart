// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Pages/HomePage.dart';
import '../widgets/PictureTile.dart';
import '../widgets/Textfield.dart';
import 'SignUp.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  loginGoogle() async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: SpinKitPianoWave(
                  color: Theme.of(context).colorScheme.secondary),
            );
          });

      final GoogleSignInAccount? user = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication userauth = await user!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: userauth.accessToken,
        idToken: userauth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.pop(context);

      FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.email)
          .set({
        'username': userCredential.user!.email!.split('@')[0],
        'motivation': 'Empty motivation...',
        'password': '',
      }, SetOptions(merge: true));

      FirebaseFirestore.instance
          .collection('chatusers')
          .doc(userCredential.user!.uid)
          .set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseException catch (error) {
      Navigator.pop(context);
      return AlertDialog(
        title: Text('Uh Oh'),
        content: Text(error.code),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Okay'),
          )
        ],
      );
    }
  }

  void SignUp(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SignUpPage.routeName);
  }

  void HomeScreen(BuildContext Ctx) async {
    showDialog(
        context: context,
        builder: (context) {
          return SpinKitPianoWave(
            color: Theme.of(context).colorScheme.secondary,
          );
        });
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailController.text,
      password: PasswordController.text,
    )
        .then((value) {
      Navigator.pop(context);
      Navigator.of(Ctx).pushReplacementNamed(HomePage.routeName);
      ScaffoldMessenger.of(Ctx).showSnackBar(SnackBar(
        content: Text('Logged in as ${emailController.text}'),
        duration: Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
      ));
    }).onError((error, stackTrace) {
      Navigator.pop(context);
      showDialog(
          context: Ctx,
          builder: (Ctx) {
            return AlertDialog(
              title: Row(
                children: [
                  Icon(Icons.error),
                  Text('Oh uh'),
                ],
              ),
              content: Text('An error occurred'),
              actions: [
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            );
          });
    });
  }

  final emailController = TextEditingController();
  final PasswordController = TextEditingController();
  final Userkey = TextInputType.name;
  final Passkey = TextInputType.visiblePassword;

  bool _passwordVisible = true;

  void toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(249, 64, 1, 1),
                Color.fromRGBO(249, 98, 9, 1),
                Color.fromRGBO(244, 115, 11, 1),
                Color.fromRGBO(246, 138, 6, 1),
              ],
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/Consilium.jpg',
                    height: 90,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Welcome back you\'ve been missed!',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  icontype: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  textController: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  keytype: Userkey,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    cursorColor: Colors.black,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _passwordVisible,
                    controller: PasswordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () => toggle(),
                        child: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: 'Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Forgot Password?',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    splashColor: Color.fromARGB(255, 31, 88, 144),
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      HomeScreen(context);
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or Continue With',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => loginGoogle(),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 90,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: PictureTile(
                      image: 'assets/images/googlee.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member yet?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => SignUp(context),
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
