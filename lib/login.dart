import 'package:flutter/material.dart';
import 'package:news_app/services/firebase_services.dart';
import 'Home.dart';
import 'Signup.dart';
import 'custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  final email1 = TextEditingController();

  final password1 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: <Widget>[
        Container(
          width: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login.jpg'),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlue[400],
                  radius: 100,
                  child: const Image(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                      color: Colors.white),
                ),
              ),
              const Text(
                'WELCOME!!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Positioned(
          top: -60,
          left: 20, // Adjust the left position as needed
          right: 20,
          child: Padding(
            padding: const EdgeInsets.only(top: 380),
            child: SizedBox(
              height: 370,
              width: 300,
              child: Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white54,
                    )),
                shadowColor: Colors.black87,
                elevation: 10,
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 40, right: 20, left: 20),
                          child: Custom_textfield(
                            text1: 'Email/Username',
                            text2: 'Email/Username',
                            icon: const Icon(Icons.email_outlined),
                            controller: email1,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.endsWith('@gmail.com')) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, right: 20, left: 20, bottom: 20),
                        child: Custom_textfield(
                          text1: 'Password',
                          text2: 'Password',
                          icon: const Icon(Icons.password),
                          controller: password1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Atleast 8 char must be provided';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 180,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 6,
                                  shadowColor: Colors.black87,
                                  backgroundColor: Colors.lightBlue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FirebaseAuthentification().login(
                                      email: email1.text,
                                      password: password1.text);

                                  print(email1.text);
                                  print(password1);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()));
                                }
                              },
                              child: const Text(
                                'LOGIN',
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Row(
                          children: [
                            const Text('Dont have an account?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: const Text('Register'))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
