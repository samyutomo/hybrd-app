import 'package:flutter/material.dart';
import 'package:hybrd_app/authentication/sign_in.dart';

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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
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
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context){
                                      return const SignInMember();
                                    }
                                ));
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
                      const InputField()
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

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _hidePassword = true;
  bool _agreeTerm = false;
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          child: TextFormField(
              validator: (value) {
                bool validUsername = RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value!);
                if (value.isEmpty) {
                  return "Input can't be empty!";
                } else if (!validUsername) {
                  return "Input only text or combination text and number!";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextFormField(
            validator: (String? value) {
              if (value?.compareTo("Male") != 0 && value?.compareTo("Female") != 0) {
                return "Please choose from drop down choices!";
              } else {
                return null;
              }
            },
            controller: _controller,
            decoration: InputDecoration(
                suffixIcon: PopupMenuButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {
                    _controller.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(value: "Male", child: Text("Male")),
                      const PopupMenuItem(
                          value: "Female", child: Text("Female"))
                    ];
                  },
                ),
                hintText: "Your Gender",
                labelText: "Gender",
                filled: true,
                fillColor: Colors.white,
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.orange)),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.white))),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            child: TextFormField(
                validator: (value) {
                  bool validEmail =
                  RegExp(r"^[a-zA-Z0-9_.-]+@[a-zA-Z0-9]+[a-zA-Z.]+$")
                      .hasMatch(value!);
                  if (value.isEmpty) {
                    return "Input can't be empty!";
                  } else if (!validEmail) {
                    return "Please input valid email format. Ex: ironman@tonystark.com";
                  } else {
                    return null;
                  }
                },
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
                if (value == null || value.isEmpty || value.length < 8) {
                  return "Input can't be empty and less than 8 characters!";
                } else {
                  return null;
                }
              },
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListTile(
            leading: Checkbox(
                value: _agreeTerm,
                onChanged: (bool? value) {
                  setState(() {
                    _agreeTerm = value!;
                  });
                }),
            title: const Text("I accept the terms and privacy policy"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: ElevatedButton(
              onPressed: _agreeTerm
                  ? () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Register Success"))
                  );
                } else {
                  showDialog(context: context,
                      builder: (context) {
                        return const AlertDialog(content: Text("Error Input"));
                      }
                  );
                }
              }
                  : null,
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )),
        )
      ]),
    );
  }
}
