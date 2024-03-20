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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CombineQuizQuestionWidget(
          questions: [
            QuizQuestionModel(
              id: 1,
              content: 'content 1',
              file: 'https://cia-images-adm.s3.amazonaws.com/question/quiz.png',
              expectedAnswer: 'asdfas 1',
            ),
            QuizQuestionModel(
              id: 2,
              content:
                  'Her mother is funny, but Carrie doesnt like her brother because he is very serious.',
              file: null,
              expectedAnswer: 'asdfas 2',
            ),
          ],
          onAnswer: (isCorrect, id) {
            StudentSnackBar.show(
                text: 'text',
                context: context,
                icon: const Icon(Icons.cancel),
                bgColor: StudentDesignSystem.config.colors.error[50]!,
                mainColor: StudentDesignSystem.config.colors.error[500]!);
          },
          // showLabel: true,
          // onFinished: () {},
          // options: [
          //   QuizQuestionModel(
          //     content: 'adsfasd',
          //     expectedAnswer: 'sadas',
          //     file: null,
          //     id: 1,
          //   ),
          //   QuizQuestionModel(
          //     content: 'adsfasd',
          //     expectedAnswer: 'sadas',
          //     file: null,
          //     id: 2,
          //   )
          // ],

          // onAnswer: (list) {
          //   StudentSnackBar.show(
          //       text: 'text',
          //       context: context,
          //       icon: const Icon(Icons.cancel),
          //       bgColor: StudentDesignSystem.config.colors.error[50]!,
          //       mainColor: StudentDesignSystem.config.colors.error[500]!);
          // },

          //     'https://cdn.pixabay.com/download/audio/2024/01/04/audio_a103e3fddf.mp3?filename=biodynamic-impact-braam-tonal-dark-184276.mp3',
        ),
      ),
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
