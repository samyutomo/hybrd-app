import 'package:flutter/material.dart';
import 'package:hybrd_app/onboarding/onboard.dart';
import 'package:lottie/lottie.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({Key? key}) : super(key: key);

  @override
  State<SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset('assets/logo-hybrd.json',
                  height: 300,
                  width: 300,
                  fit: BoxFit.fill,
                  controller: _controller,
                  animate: true,
                  repeat: true, onLoaded: (composition) {
                setState(() {
                  _controller.forward().whenComplete(() =>
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoardingPage())));
                });
              }),
            ),
            const SizedBox(height: 20),
            const Text(
              "Hybrid",
              style: TextStyle(
                  fontFamily: 'Panton',
                  fontSize: 60,
                  letterSpacing: 8,
                  color: Color.fromRGBO(254, 167, 37, 60)),
            ),
            const Text(
              "livin seamlessly",
              style: TextStyle(
                  fontFamily: 'Poppins', fontSize: 28, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
