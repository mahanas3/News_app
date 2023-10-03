import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model_class/classmodel.dart';
import 'package:news_app/services/firebase_services.dart';
import 'package:news_app/services/firesrore_services.dart';

import 'Home.dart';
import 'custom_textfield.dart';
import 'login.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  final name2 = TextEditingController();

  var email2 = TextEditingController();

  final contact2 = TextEditingController();

  final password2 = TextEditingController();

  final formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: 600,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login.jpg'),
                fit: BoxFit.fill)),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
            'REGISTER',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 490,
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Card(
                      shadowColor: Colors.black87,
                      elevation: 13,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.white)),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, right: 20, left: 20),
                              child: Custom_textfield(
                                  text1: 'FullName',
                                  text2: 'FullName',
                                  icon: const Icon(
                                      Icons.perm_contact_calendar_sharp),
                                  controller: name2,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.startsWith(value.toUpperCase())) {
                                      return 'First letter must be a Uppercase';
                                    }
                                    return null;
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 20, left: 20),
                              child: Custom_textfield(
                                text1: 'Email/Username',
                                text2: 'Email/Username',
                                icon: const Icon(Icons.email_outlined),
                                controller: email2,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.endsWith('@gmail.com')) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 20, left: 20, bottom: 10),
                              child: Custom_textfield(
                                  text1: 'PhoneNo',
                                  text2: 'PhoneNo',
                                  icon: const Icon(Icons.contact_phone),
                                  controller: password2,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 10) {
                                      return 'Enter atleast 10 digits';
                                    }
                                    return null;
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 20, left: 20),
                              child: Custom_textfield(
                                text1: 'Password',
                                text2: 'Password',
                                icon: const Icon(Icons.password),
                                controller: password2,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Atleast 8 char must be provided';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                                height: 50,
                                width: 190,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.black87,
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        backgroundColor: Colors.lightBlue),
                                    onPressed: () async {
                                      print(email2.text);
                                      print(password2.text);
                                      if (formkey.currentState!.validate()) {
                                        try {
                                          await FirebaseAuthentification()
                                              .signUp(
                                                  email: email2.text,
                                                  password: password2.text);

                                          var user = Student(
                                              name: name2.text,
                                              email: email2.text,
                                              phoneNo: contact2.text,
                                              password: password2.text);
                                          UserRepository().createdata(user);



                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home()));
                                        } catch (e) {
                                          print(e);
                                        }
                                      }
                                    },
                                    child: const Text('SIGNUP'))),
                            Padding(
                              padding: const EdgeInsets.only(left: 55),
                              child: Row(
                                children: [
                                  const Text('Already A Member?'),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Login()));
                                      },
                                      child: const Text('SignIn'))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
