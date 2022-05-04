import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hybrd_app/pages/home.dart';

class SignInMember extends StatefulWidget{
  const SignInMember({Key? key}) : super(key: key);

  @override
  State<SignInMember> createState() => _SignInMemberState();
}

class _SignInMemberState extends State<SignInMember> {
  bool _hidePassword = true;
  final TextEditingController _controllerMail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controllerMail.dispose();
    _controllerPass.dispose();
    super.dispose();
  }

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
                        margin: const EdgeInsets.only(top: 70),
                        child: const Text(
                          "Log In",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                          const SizedBox(height: 70),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                              child: TextFormField(
                                  validator: (value) {
                                    bool validEmail =
                                    RegExp(r"^[a-zA-Z0-9_.-]+@[a-zA-Z0-9]+\.[a-zA-Z]+[a-zA-Z]+[a-zA-Z.]*$")
                                        .hasMatch(value!);
                                    if (value.isEmpty) {
                                      return "Input can't be empty!";
                                    } else if (!validEmail) {
                                      return "Please input valid email format. Ex: ironman@tonystark.com";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _controllerMail,
                                  decoration: const InputDecoration(
                                      hintText: "Your Email",
                                      labelText: "Email",
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          borderSide: BorderSide(color: Colors.orange)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          borderSide: BorderSide(color: Colors.white))))),
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 10.0, right: 40, left: 40, bottom: 40),
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Input can't be empty!";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _controllerPass,
                                obscureText: _hidePassword,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _hidePassword = !_hidePassword;
                                        });
                                      },
                                      icon: Icon(_hidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  hintText: "Input Password",
                                  labelText: "Password",
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(color: Colors.orange)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(color: Colors.white)),
                                )),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text(
                              "By logging in you agree to our Terms, Data Policy and Cookies Policy",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0, right: 40.0, left: 40.0),
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              content: Text("Login...")));
                                      final credential = await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                        email: _controllerMail.text,
                                        password: _controllerPass.text,
                                      );
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) =>  HomePage(credential: credential)));
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const AlertDialog(
                                                  content:
                                                  Text("No user found for that email"));
                                            });
                                      } else if (e.code == 'wrong-password') {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return const AlertDialog(
                                                  content: Text(
                                                      "Wrong Password!"));
                                            });
                                      }
                                    } catch (e) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(content: Text(e.toString()));
                                          });
                                    }
                                  }
                                }
                                    ,
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)))),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )),
                          )
                        ]),
                      )

                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
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
                )
              ],
            )));
  }
}