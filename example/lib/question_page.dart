import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? selected;
  bool? isSelected;

  bool canSpeak = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 60),
      child: TaskFlipCardTypeWidget(
        showLabel: true,
        item: QuizQuestionModel(
            id: 1,
            content: 'content',
            file: null,
            expectedAnswer: 'expected Answer'),
      ),
      //   child: Column(
      //     children: [
      //       const QuestionsPercentIndicatorWidget(
      //         totalQuestions: 5,
      //         finishedQuestions: 1,
      //       ),
      //       Expanded(
      //         child: MultipleChoiceQuestionWidget(
      //           title: 'Question content',
      //           // expectedAnswer: 'my name is william',
      //           file:
      //               'https://cia-images-adm.s3.amazonaws.com/question/86325.webm',
      //           // onCantSpeakNow: () {
      //           //   setState(() {
      //           //     canSpeak = !canSpeak;
      //           //   });
      //           // },
      //           onAnswer: (id) {},
      //           options: [
      //             StudentTaskOptionModel(
      //               id: 1,
      //               content: 'I want to sleep',
      //               correct: true,
      //             ),
      //             StudentTaskOptionModel(
      //               id: 2,
      //               content: 'I went to slept',
      //               correct: false,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    )
        // body: MatchWidget(
        //   file: null,

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
