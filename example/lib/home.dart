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
          BoxText.heading4('Entre com seu celular and lets learn!'),
          const Text('Botões'),
          const SpaceVertical.x4(),
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
          const SpaceVertical.x4(),
          const Text('Inputs'),
          const SpaceVertical.x4(),
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
            ),
          ),
          const SpaceVertical.x4(),
          StudentInputWidget(
            prefix: const Icon(
              Icons.key,
            ),
            controller: TextEditingController(),
            hintText: 'Username',
            sufix: const Icon(
              Icons.ac_unit,
            ),
          ),
          Form(
            key: _formKey,
            child: StudentInputWidget(
              prefix: const Icon(
                Icons.key,
              ),
              controller: TextEditingController(),
              hintText: 'Username',
              sufix: const Icon(
                Icons.person,
              ),
              validator: (p0) {
                return 'Error message';
              },
            ),
          ),
          const SpaceVertical.x4(),
          StudentButtonWidget(
            title: 'Testar',
            onTap: () {
              _formKey.currentState?.validate();
            },
          ),
          const Icon(IconlyBold.activity),
        ],
      ),
    );
  }
}
