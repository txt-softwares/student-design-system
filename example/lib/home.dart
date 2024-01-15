import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          StudentInputWidget(
              controller: controller,
              hintText: 'Username',
              prefix: Icons.person),
          const SpaceVertical.x4(),
          StudentInputWidget(
            controller: controller,
            hintText: 'Username',
            sufix: Icons.visibility_off,
          ),
        ],
      ),
    );
  }
}
