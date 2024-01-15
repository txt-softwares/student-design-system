import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              controller: TextEditingController(),
              hintText: 'Username',
              prefix: const Icon(Icons.person)),
          const SpaceVertical.x4(),
          StudentInputWidget(
              controller: TextEditingController(),
              hintText: 'Username',
              sufix: const Icon(
                Icons.visibility_off,
              )),
          const SpaceVertical.x4(),
          StudentInputWidget(
              prefix: const Icon(
                Icons.key,
              ),
              controller: TextEditingController(),
              hintText: 'Username',
              sufix: const Icon(
                Icons.ac_unit,
              )),
          StudentInputWidget(
            prefix: const Icon(
              Icons.key,
            ),
            controller: TextEditingController(),
            hintText: 'Username',
            sufix: const Icon(
              Icons.person,
            ),
            validatorKey: _formKey,
            validator: (p0) {
              return 'Error message';
            },
          ),
          const SpaceVertical.x4(),
          StudentButtonWidget(
            title: 'Testar',
            onTap: () {
              _formKey.currentState?.validate();
            },
          )
        ],
      ),
    );
  }
}
