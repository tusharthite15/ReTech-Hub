import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oa_drawer/pages/Authentication/login_page.dart';
import '../../widgets/widgets.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      )
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 350,
                child: Image.asset(
                  "asset/registration_page_image.webp",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 1),
              const Text(
                "Create an Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Join ReTech Hub to start exploring tech accessories for resale",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(),

                ),
                // for name validation
                validator: (val) {
                  if (val!.isNotEmpty) {
                    return null;
                  } else {
                    return "Name can't be empty";
                  }
                },
                onChanged: (val) {
                  setState(() {
                    var fullName = val;
                    print(fullName);
                  });
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                validator: (val) {
                  if (val!.isEmpty ||
                      !RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(val)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val!.isEmpty || val.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              // TextFormField(
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     labelText: "Re-enter Password",
              //     prefixIcon: Icon(
              //       Icons.lock,
              //       color: Theme.of(context).primaryColor,
              //     ),
              //     border: OutlineInputBorder(),
              //
              //
              //   ),
              // )
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Implement your registration logic here
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign In",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
