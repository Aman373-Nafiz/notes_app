import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/presentation/pages/Addwork.dart';
import 'package:notes_app/presentation/pages/Detail%20Screen.dart';
import 'package:notes_app/presentation/pages/Registration.dart';
import 'package:notes_app/presentation/pages/SignIn.dart';
import 'package:notes_app/presentation/pages/check.dart';

import '../../data/repositories/Auth repositort.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();

    // Initialize GoRouter only once in initState
    Get.lazyPut(() => AuthRepository());
    _router = GoRouter(
      initialLocation: '/', // Set initial route
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Check(), // Main check for authentication
        ),
        GoRoute(
          path: '/add_work',
          builder: (context, state) => AddWorkDialogScreen(),
        ),
        GoRoute(
          path: '/details',
          builder: (context, state) => Details(ind: 0),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => Login(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => Registration(),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text('Page Not Found!'), // Error handler for unknown routes
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router, // Using routerConfig to simplify GoRouter setup
    );
  }
}
