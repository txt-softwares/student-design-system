import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultipleChoiceQuestionWidget(
        file:
            'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
        onAnswer: (id) {
          setState(() {
            selected = id;
          });
        },
        onSelected: (id) {
          setState(() {
            selected = id;
          });
        },
        options: [
          StudentTaskOptionModel(
            content: 'Walking in the park',
            correct: false,
            id: 1,
          ),
          StudentTaskOptionModel(
            content: 'In the bed',
            correct: true,
            id: 2,
          ),
          StudentTaskOptionModel(
            content: 'Playing videogame',
            correct: false,
            id: 3,
          ),
          StudentTaskOptionModel(
            content: 'Walking in the park',
            correct: false,
            id: 4,
          ),
        ],
        selected: selected,
        title:
            'Look at the picture: Where were this person at 3 o’clock yesterday afternoon?',
      ),
    );
  }
}
