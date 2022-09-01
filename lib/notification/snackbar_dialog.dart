import 'package:flutter/material.dart';

class NotifDialog extends StatelessWidget {
  final String information;

  const NotifDialog({Key? key, required this.information}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1.0,
      backgroundColor: const Color.fromRGBO(254, 167, 37, 0.7),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Text(
          information,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontFamily: 'Poppins', fontSize: 18),
        ),
      ),
    );
  }
}

void notifSnackBar(BuildContext context, String information) {
  var mediaHeight = MediaQuery.of(context).size.height;
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      information,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.white, fontFamily: 'Poppins', fontSize: 16.0),
    ),
    elevation: 1,
    padding: const EdgeInsets.all(40.0),
    margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: mediaHeight / 2),
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    backgroundColor: const Color.fromRGBO(254, 167, 37, 0.7),
    duration: const Duration(seconds: 2),
  ));
}
