import 'package:flutter/material.dart';

class SignInMember extends StatefulWidget{
  const SignInMember({Key? key}) : super(key: key);

  @override
  State<SignInMember> createState() => _SignInMemberState();
}

class _SignInMemberState extends State<SignInMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)
        ),
        title: Text("Login Area under maintenance"),
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              Container(
                alignment: Alignment.center,
                  child: const Text("Login Area",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}