import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/view/auth/login_page.dart';
import 'package:hotel/view/auth/register_page.dart';
import 'package:hotel/view/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  login_page(),
    );
  }
}
