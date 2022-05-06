import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hybrd_app/pages/home.dart';

class LoadUser extends StatelessWidget {
  final UserCredential credential;

  const LoadUser({Key? key, required this.credential}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage(credential: credential);
      }));
    });
    return const Scaffold();
  }
}
