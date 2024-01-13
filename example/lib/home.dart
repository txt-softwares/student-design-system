import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          StudentButtonWidget(
            prefixIcon: Icon(Icons.airplane_ticket),
            leading: Icon(Icons.airplane_ticket),
            title: 'Button',
            onTap: () {},
          ),
          const SpaceVertical.x4(),
          const StudentButtonWidget(
            title: 'Button',
            onTap: null,
          ),
        ],
      ),
    );
  }
}
