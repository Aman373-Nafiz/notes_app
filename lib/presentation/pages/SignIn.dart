import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:notes_app/data/repositories/Auth%20repositort.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final AuthRepository controller = Get.put(AuthRepository());

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left: h * 0.037),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login', style: TextStyle(color: Colors.white, fontSize: 21)),
            // Email and Password fields
            GestureDetector(
              onTap: () async {
                controller.signIn(email.text, pass.text);
                Get.offAllNamed('/');
              },
              child: Container(
                height: 50,
                width: w / 1.3,
                color: Colors.purple[300],
                child: Center(child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 15))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/register');
              },
              child: Text('Don\'t have an account? Register', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
