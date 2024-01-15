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
        title: const Text('Title'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          StudentButtonWidget(
            title: 'Button',
            onTap: () {},
          ),
          const SpaceVertical.x4(),
          StudentButtonWidget(
            prefixIcon: const Icon(Icons.airplane_ticket),
            leading: const Icon(Icons.airplane_ticket),
            title: 'Button',
            onTap: () {},
          ),
          const SpaceVertical.x4(),
          const StudentButtonWidget(
            title: 'Button',
            onTap: null,
          ),
          const SpaceVertical.x4(),
          StudentButtonWidget.secoundary(
            title: 'Button',
            onTap: () {},
          ),
          const SpaceVertical.x4(),
          const StudentButtonWidget.secoundary(title: 'Button', onTap: null),
          const SpaceVertical.x4(),
          const StudentButtonWidget(
            isLoading: true,
            title: 'Button',
            onTap: null,
          ),
        ],
      ),
    );
  }
}
