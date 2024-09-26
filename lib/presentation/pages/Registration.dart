import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import 'package:notes_app/data/repositories/Auth%20repositort.dart';

class Registration extends StatelessWidget {
  Registration({super.key});
  final AuthRepository todoController = Get.put(AuthRepository());
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController cpass = TextEditingController();

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
            SizedBox(height: h * 0.0466),
            Text('Register', style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w600)),
            SizedBox(height: h * 0.037),
            Text('Email', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
            SizedBox(height: h * 0.018),
            Container(
              height: 50,
              width: w / 1.3,
              child: TextFormField(
                controller: email,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(labelText: 'Enter your email', border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: h * 0.037),
            Text('Password', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
            SizedBox(height: h * 0.018),
            Container(
              height: 50,
              width: w / 1.3,
              child: TextFormField(
                controller: pass,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(labelText: 'Enter your password', border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: h * 0.037),
            Text('Confirm Password', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
            SizedBox(height: h * 0.018),
            Container(
              height: 50,
              width: w / 1.3,
              child: TextFormField(
                controller: cpass,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(labelText: 'Enter your confirmed password', border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: h * 0.15),
            GestureDetector(
              onTap: () async {
                if (pass.text == cpass.text) {
                  await todoController.register(email.text, pass.text);
                } else {
                  print("Passwords do not match");
                }
              },
              child: Container(
                height: 50,
                width: w / 1.3,
                color: Colors.purple[300],
                child: Center(child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 15))),
              ),
            ),
            SizedBox(height: h * 0.025),
            GestureDetector(
              onTap: () {
                context.go('/login');
              },
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(fontSize: 11, color: Colors.white),
                  children: [TextSpan(text: 'Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
