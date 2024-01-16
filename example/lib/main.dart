import 'package:example/home.dart';
import 'package:example/style.dart';
import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

void main() {
  StudentDesignSystem.init(AppStyle.theme);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: StudentAppTheme.getThemeData(),
      home: const HomePage(),
    );
  }
}
