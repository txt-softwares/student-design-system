// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_design_system/student_design_system.dart';

import '../../shared/head_question_widget.dart';

class OrderSentenceTypeWidget extends StatefulWidget {
  const OrderSentenceTypeWidget({
    Key? key,
    required this.content,
    required this.onAnswer,
    required this.expectedAnswer,
    this.file,
  }) : super(key: key);

  final String content;
  final String expectedAnswer;
  final String? file;

  final Function(String orderedSetence) onAnswer;

  @override
  State<OrderSentenceTypeWidget> createState() =>
      _OrderSentenceTypeWidgetState();
}

class Word {
  int id;
  String text;
  Word({
    required this.id,
    required this.text,
  });
}

class _OrderSentenceTypeWidgetState extends State<OrderSentenceTypeWidget> {
  List<Word> selectedWords = [];

  List<Word> allAvaliableWords = [];

  void setWordAnswer(Word item) {
    selectedWords.add(item);
    setState(() {});
  }

  void removeWordAnswer(Word item) {
    selectedWords.remove(item);
    setState(() {});
  }

  @override
  void initState() {
    Future.microtask(() {
      setState(() {
        final items = widget.expectedAnswer.split(" ");
        items.shuffle();

        for (int i = 0; i < items.length; i++) {
          allAvaliableWords.add(Word(id: i, text: items[i]));
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              HeadQuestionWidget(
                file: widget.file,
                title: widget.content,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: List<Widget>.generate(
                      selectedWords.length,
                      (index) {
                        final option = selectedWords[index];
                        return _buildItem(option, false);
                      },
                    ),
                  ),
                  SizedBox(height: selectedWords.isNotEmpty ? 0 : 63),
                  Divider(
                    color: StudentDesignSystem.config.colors.darkblue[200],
                    height: 1,
                  ),
                  const SizedBox(height: 44),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: List<Widget>.generate(
                        allAvaliableWords.length,
                        (index) {
                          final option = allAvaliableWords[index];
                          return _buildItem(option, true);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: StudentDesignSystem.config.colors.darkblue[200],
          height: 1,
        ),
        Container(
          padding: const EdgeInsets.all(24),
          child: StudentButtonWidget(
            title: 'Verificar',
            onTap: allAvaliableWords.length == selectedWords.length
                ? () => widget.onAnswer(
                      selectedWords.fold(
                          '',
                          (previousValue, element) =>
                              '$previousValue $element'),
                    )
                : null,
          ),
        )
      ],
    );
  }

  Widget _buildItem(Word item, bool toAdd) {
    return Container(
      margin: const EdgeInsets.only(
        right: 6,
        left: 6,
        bottom: 12,
      ),
      child: ElevatedButton(
        onPressed: toAdd &&
                selectedWords.contains(item) &&
                allAvaliableWords.contains(item)
            ? null
            : () {
                if (toAdd) {
                  setWordAnswer(item);
                } else {
                  removeWordAnswer(item);
                }
              },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor: toAdd &&
                  selectedWords.contains(item) &&
                  allAvaliableWords.contains(item)
              ? StudentDesignSystem.config.colors.dark[200]
              : null,
          backgroundColor: StudentDesignSystem.config.colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
              color: StudentDesignSystem.config.colors.dark[200]!,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 25,
          ),
        ),
        child: BoxText.bodyXLargeBold(
          item.text,
          color: toAdd &&
                  selectedWords.contains(item) &&
                  allAvaliableWords.contains(item)
              ? StudentDesignSystem.config.colors.dark[200]
              : null,
        ),
      ),
    );
  }
}
