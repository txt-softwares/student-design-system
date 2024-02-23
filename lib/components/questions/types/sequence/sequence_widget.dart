import 'package:flutter/material.dart';

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
    allAvaliableWords.removeWhere((element) => element == item);
    setState(() {});
  }

  void removeWordAnswer(String item) {
    selectedWords.remove(item);
    allAvaliableWords.add(item);
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
                children: [
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: List<Widget>.generate(
                        selectedWords.length,
                        (index) {
                          final option = selectedWords[index];
                          return _buildItem(option, false);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Divider(
                    color: StudentDesignSystem.config.colors.darkblue[200],
                    height: 1,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: List<Widget>.generate(
                      allAvaliableWords.length,
                      (index) {
                        final option = allAvaliableWords[index];
                        return _buildItem(option, true);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
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
      margin: const EdgeInsets.only(right: 20, bottom: 10),
      child: ElevatedButton(
        onPressed: () {
          if (toAdd) {
            setWordAnswer(item);
          } else {
            removeWordAnswer(item);
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 25,
            ),
          ),
        ),
        child: Text(item),
      ),
    );
  }
}
