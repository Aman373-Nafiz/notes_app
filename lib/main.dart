import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_app/presentation/pages/Home.dart';
import 'data/repositories/Auth repositort.dart';
import 'firebase_options.dart';
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
  
  runApp( Home());
}



