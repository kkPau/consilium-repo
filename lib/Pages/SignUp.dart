// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mini_project/Pages/LoginPage.dart';

import '../widgets/Textfield.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/sign-up';
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passController = TextEditingController();
  final conpassController = TextEditingController();
  bool _passwordVisible = true;

  void toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  Future<UserCredential> signup() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SpinKitPianoWave(
                color: Theme.of(context).colorScheme.secondary),
          );
        });
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passController.text);
      Navigator.pop(context);

      FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.email)
          .set({
        'username': emailController.text.split('@')[0],
        'motivation': 'Empty motivation...',
        'password': passController.text,
      });

      FirebaseFirestore.instance
          .collection('chatusers')
          .doc(userCredential.user!.uid)
          .set(
              {'uid': userCredential.user!.uid, 'email': emailController.text});

      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      throw Exception(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(249, 64, 1, 1),
              Color.fromRGBO(249, 98, 9, 1),
              Color.fromRGBO(244, 115, 11, 1),
              Color.fromRGBO(246, 138, 6, 1),
            ])),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Consilium',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/Consilium.jpg',
                      height: 90,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Join The Family!',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                    textController: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    keytype: TextInputType.name,
                    icontype: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      cursorColor: Colors.black,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _passwordVisible,
                      controller: passController,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      cursorColor: Colors.black,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _passwordVisible,
                      controller: conpassController,
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
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      child: Container(
                        width: double.maxFinite,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (passController.text != conpassController.text) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Passwords do not match'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                      ),
                                    )
                                  ],
                                );
                              });
                          return;
                        }
                        try {
                          signup();
                        } catch (e) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Uh oh'),
                                  content: Text(e.toString()),
                                );
                              });
                        }
                        // FirebaseAuth.instance.createUserWithEmailAndPassword(
                        //   email: emailController.text,
                        //   password: passController.text
                        // ).then((value){
                        //   print('Account created');
                        //   Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                        // }).onError((error, stackTrace){
                        //   showDialog(context: context, builder: (context){
                        //     return AlertDialog(
                        //       title: Text('Uh oh'),
                        //       content: Text('An error occurred'),
                        //     );
                        //   });
                        // });
                        // FirebaseFirestore.instance.collection('Users').doc()
                        // Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
