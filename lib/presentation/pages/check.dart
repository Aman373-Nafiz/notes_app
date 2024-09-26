import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/data/repositories/Auth%20repositort.dart';

class Check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ensure that AuthRepository is already initialized in main.dart
    final authController = Get.find<AuthRepository>();

    return Obx(() {
      // Show loading spinner while checking login state
      if (authController.isLoading.isTrue) {
        return const Center(child: CircularProgressIndicator());
      } else {
        // If logged in, go to Home, otherwise go to Login
        if (authController.isLoggedIn.isTrue) {
          context.go('/home');
        } else {
          context.go('/login');
        }
        return const SizedBox(); // Empty widget while redirecting
      }
    });
  }
}
