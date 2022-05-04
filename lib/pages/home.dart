import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final UserCredential credential;

  const HomePage({Key? key, required this.credential}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? userName = credential.user;
    userName?.reload();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello, ${userName?.displayName}\nWelcome to Hybrd!",
              style: const TextStyle(fontFamily: 'Panton', fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "$credential",
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}
