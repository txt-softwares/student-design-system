import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/models/match_model.dart';
import 'package:student_design_system/components/questions/types/combine/match_widget.dart';
import 'package:student_design_system/components/questions/types/true_false/true_false_widget.dart';
import 'package:student_design_system/student_design_system.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? selected;
  bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ReorderQuestionTypeWidget(
        options: [
          StudentTaskOptionModel(content: 'students', correct: false, id: 1),
          StudentTaskOptionModel(content: 'the', correct: false, id: 2),
          StudentTaskOptionModel(content: 'to', correct: false, id: 3),
          StudentTaskOptionModel(content: 'call', correct: false, id: 4),
          StudentTaskOptionModel(content: 'him', correct: false, id: 5),
        ],
        file: null,
        title: 'Unscramble the words to form sentences',
        onAnswer: (list) {},
      ),
      // body: MatchWidget(
      //   file: null,
      //   //   file:
      //   //       'http://commondatastorage.googleapis.com/codeskulptor-assets/sounddogs/thrust.mp3',
      //   title: 'Tap the matching word pair',
      //   match: [
      //     MatchModel(id: 1, content: 'students', match: 'aluno'),
      //     MatchModel(id: 2, content: 'grandmother', match: 'avó'),
      //     MatchModel(id: 3, content: 'school', match: 'escola'),
      //     MatchModel(id: 4, content: 'party', match: 'festa'),
      //     MatchModel(id: 5, content: 'garden', match: 'jardim'),
      //     MatchModel(id: 6, content: 'food', match: 'comida'),
      //   ],
      //   onAnswer: (totalAnswers) {},
      // ),
      // body: TrueFalseQuestionTypeWidget(
      //   title:
      //       'The word "them" is the personal object pronoun relative to the personal pronoun "they"',
      //   file:
      //       'http://commondatastorage.googleapis.com/codeskulptor-assets/sounddogs/thrust.mp3',
      //   image: 'assets/images/true_or_false.png',
      //   onAnswer: (id) {},
      // ),
      // body: MultipleChoiceQuestionWidget(
      //   //file: null,
      //   file:
      //       'http://commondatastorage.googleapis.com/codeskulptor-assets/sounddogs/thrust.mp3',
      //   onAnswer: (id) {
      //     // setState(() {
      //     //   selected = id;
      //     // });
      //   },
      //   // onSelected: (id) {
      //   //   setState(() {
      //   //     selected = id;
      //   //   });
      //   // },
      //   options: [
      //     StudentTaskOptionModel(
      //       content: 'Walking in the park',
      //       correct: false,
      //       id: 1,
      //     ),
      //     StudentTaskOptionModel(
      //       content: 'In the bed',
      //       correct: true,
      //       id: 2,
      //     ),
      //     StudentTaskOptionModel(
      //       content: 'Playing videogame',
      //       correct: false,
      //       id: 3,
      //     ),
      //     StudentTaskOptionModel(
      //       content: 'Walking in the park',
      //       correct: false,
      //       id: 4,
      //     ),
      //   ],
      //   // selected: selected,
      //   title: 'Where do they go?',
      //   // content: 'Look at the picture: Where were this person',
      // ),
    );
  }
}
