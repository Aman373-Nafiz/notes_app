import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';

import 'package:notes_app/data/repositories/Work%20repositort.dart';  // GetX Controller

class AddWorkDialogScreen extends StatelessWidget {
  AddWorkDialogScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Secondary(),
    );
  }
}

class Secondary extends StatelessWidget {
  const Secondary({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;

    final WorkRepository todoController = Get.put(WorkRepository());

  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.go('/home');  
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 22,
          ),
        ),
        backgroundColor: Colors.yellow,
        title: Text(
          "My TODO",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        shape: CircleBorder(),
        onPressed: () {
          todoController.addData(
            todoController.workController.text,
           
            todoController.descController.text,
            false,
          );
        
          context.go('/home');  // GoRouter navigation after saving
        },
        child: Icon(Icons.done),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 25, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Task",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: h * 0.02),
            Container(
              height: 50,
              width: w / 1.2,
              child: TextFormField(
                controller: todoController.workController,
                decoration: InputDecoration(
                  labelText: 'Enter your task',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.03),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: h * 0.04),
            Container(
              height: 60,
              width: w / 1.2,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                controller: todoController.descController,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  labelText: 'Enter your Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            
           
           
          ],
        ),
      ),
    );
  }
}
