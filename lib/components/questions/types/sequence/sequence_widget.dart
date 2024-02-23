import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

import '../../../../config/ds_config.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../shared/head_question_widget.dart';

class OrderSentenceTypeWidget extends StatefulWidget {
  const OrderSentenceTypeWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.file,
    required this.onAnswer,
  }) : super(key: key);

  final String? title;
  final String? file;
  final String content;
  final Function(String orderedSetence) onAnswer;

  @override
  State<OrderSentenceTypeWidget> createState() =>
      _OrderSentenceTypeWidgetState();
}

class _OrderSentenceTypeWidgetState extends State<OrderSentenceTypeWidget> {
  List<String> selectedWords = [];

  List<String> allAvaliableWords = [];

  void setWordAnswer(String item) {
    selectedWords.add(item);
    setState(() {});
  }

  void removeWordAnswer(String item) {
    selectedWords.remove(item);
    setState(() {});
  }

  @override
  void initState() {
    Future.microtask(() {
      setState(() {
        final items = widget.content.split(" ");
        items.shuffle();
        allAvaliableWords = List.from(items);
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
                title: widget.title,
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

  Widget _buildItem(String item, bool toAdd) {
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
          item,
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
