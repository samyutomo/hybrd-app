import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hybrd_app/firebase_options.dart';
import 'package:hybrd_app/onboarding/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MainHybrd());
}

class MainHybrd extends StatelessWidget {
  const MainHybrd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hybrd",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const SplashLogo()
    );
  }
}
