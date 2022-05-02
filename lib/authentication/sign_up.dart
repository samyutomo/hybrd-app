import 'package:flutter/material.dart';

class SignUpMember extends StatelessWidget {
  const SignUpMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Image.asset(
          'images/background.png',
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 35,
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Create your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Do you already have an account?",
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: Text("Sign In"),
                              );
                            });
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                child: TextField(
                    decoration: InputDecoration(
                  hintText: "Your Username",
                  labelText: "Username",
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.white)),
                )),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                child: TextField(
                    decoration: InputDecoration(
                  hintText: "Your Email",
                  labelText: "Email",
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.white)),
                )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0, right: 40, left: 40, bottom: 40),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye),
                      hintText: "Input Password",
                      labelText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.white)),
                    )),
              ),
              const AgreeTerms()

            ],
          ),
        )
      ],
    )));
  }
}

class AgreeTerms extends StatefulWidget{
  const AgreeTerms({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AgreeTermsState();
}

class _AgreeTermsState extends State<AgreeTerms>{
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListTile(
            leading: Checkbox(
                value: agree,
                onChanged: (bool? value){
                  setState(() {
                    agree = value!;
                  });
                }
            ),
            title: const Text("I accept the terms and privacy policy"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: ElevatedButton(
              onPressed: agree ?() {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text("Register success"),
                      );
                    });
              } : null,
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
              child: const Padding(
                padding:
                EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )),
        )
      ],
    );
  }
}
