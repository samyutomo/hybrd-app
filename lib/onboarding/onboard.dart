import 'package:flutter/material.dart';
import 'package:hybrd_app/authentication/sign_in.dart';
import 'package:hybrd_app/authentication/sign_up.dart';
import 'package:onboarding/onboarding.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late int index;
  final onboardingList = [
    PageModel(
      widget: DecoratedBox(
        decoration: const BoxDecoration(shape: BoxShape.rectangle),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Image.asset('images/pic_onboarding1.png')),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                child: Text(
                  "Attend Onsite",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: Text(
                  "Choose your event and exhibition with new ddition published and new experience every day",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: const BoxDecoration(shape: BoxShape.rectangle),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Image.asset('images/pic_onboarding2.png')),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                child: Text(
                  "Join Online",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: Text(
                  "Remote and safely join your event and exhibition with notification schedule",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    )
  ];

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'images/background.png',
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Onboarding(
          pages: onboardingList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: const BoxDecoration(shape: BoxShape.rectangle),
              child: Column(
                children: [
                  CustomIndicator(
                    netDragPercent: dragDistance,
                    pagesLength: pagesLength,
                    indicator: Indicator(
                        activeIndicator:
                            const ActiveIndicator(color: Colors.grey),
                        closedIndicator:
                            const ClosedIndicator(color: Colors.orange),
                        indicatorDesign: IndicatorDesign.polygon(
                            polygonDesign: PolygonDesign(
                                polygon: DesignType.polygon_circle))),
                  ),
                  const SizedBox(height: 40),
                  Container(
                      height: 160,
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: index == pagesLength - 1
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignInMember()));
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20)))),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: Text(
                                        "Log In",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    )),
                                const SizedBox(height: 20),
                                OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUpMember()));
                                    },
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: Colors.orange, width: 2.0),
                                        backgroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))))
                              ],
                            )
                          : null),
                ],
              ),
            );
          },
        )
      ],
    ));
  }
}
