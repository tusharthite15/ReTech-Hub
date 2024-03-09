import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key); // Specify Key for the super constructor
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Add formKey declaration

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const Text(
                  "ReTech Hub",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text("Login now and see What they are talking",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    )),
                Image.asset(
                  "asset/people-using-mobile-network-talking-phone-communication-social-media-people-using-mobile-network-talking-phone-232739903.jpg",
                ),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                      print(email);
                    });
                  },
                  validator: (val) {
                    return RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val!)
                        ? null
                        : "Please enter valid email address";
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  validator: (val) {
                    return val!.length < 6
                        ? "Password must be at least 6 characters"
                        : null;
                  },
                  onChanged: (val) {
                    setState(() {
                      password = val;
                      print(password);
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    onPressed: () {
                      login();
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "Don't have an account?",
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Register here",
                        style: const TextStyle(color: Colors.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            nextScreen(context, const RegisterPage());
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    // Implement your login logic here
  }
}

void nextScreen(BuildContext context, Widget page) {
  // Implement your navigation logic here
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); // Placeholder for RegisterPage UI
  }
}

String? email;
String? password;
