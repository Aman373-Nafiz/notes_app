import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:notes_app/data/repositories/Work%20repositort.dart';  // GetX Controller

class Details extends StatelessWidget {
  final int ind;
  Details({super.key, required this.ind});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailsMain(ind: ind),
    );
  }
}

class DetailsMain extends StatelessWidget {
  final int ind;
  DetailsMain({super.key, required this.ind});

  @override
  Widget build(BuildContext context) {
   final WorkRepository todoController = Get.put(WorkRepository());
    todoController.fetchData();
    var h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.go('/home');  // GoRouter navigation
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
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Title of the Task :",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.red,
                    ),
                  ),
                  WidgetSpan(child: SizedBox(width: 7.5)),
                  TextSpan(
                    text: todoController.aw.isNotEmpty
                        ? todoController.aw[ind].title
                        : "<None>",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * 0.04),
           
                  
            Expanded(
              child: SingleChildScrollView(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Task Description :",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.red,
                        ),
                      ),
                      WidgetSpan(child: SizedBox(width: 7.5)),
                      TextSpan(
                        text: todoController.aw.isNotEmpty
                            ? todoController.aw[ind].description
                            : "<None>",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          
      
          ]))   
   );
  }
}
