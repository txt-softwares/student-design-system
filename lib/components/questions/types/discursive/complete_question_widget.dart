import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

import '../../shared/head_question_widget.dart';

class CompleteTheSentenceypeWidget extends StatefulWidget {
  const CompleteTheSentenceypeWidget({
    Key? key,
    required this.title,
    required this.expectedAnswer,
    required this.onAnswer,
    this.file,
  }) : super(key: key);

  final String expectedAnswer;
  final String title;
  final String? file;
  final Function(String text) onAnswer;

  @override
  State<CompleteTheSentenceypeWidget> createState() =>
      _CompleteTheSentenceypeWidgetState();
}

class _CompleteTheSentenceypeWidgetState
    extends State<CompleteTheSentenceypeWidget> {
  final _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    RegExp regExp = RegExp(r"{([^}]+)}");
    Match? match = regExp.firstMatch(widget.expectedAnswer);

    String partBefore = widget.expectedAnswer.substring(0, match?.start);
    String partInside = match?.group(1) ?? "";
    String? partAfter =
        match?.end != null ? widget.expectedAnswer.substring(match!.end) : null;
    return Column(
      key: Key(widget.expectedAnswer),
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
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: partBefore,
                          style: TextStyles.bodyXLargeBold,
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: partInside.length * 10,
                            height: 25,
                            child: TextField(
                              autofocus: true,
                              textAlign: TextAlign.center,
                              onChanged: (value) => setState(() {}),
                              style: TextStyles.bodyXLargeBold,
                              controller: _textFieldController,
                              cursorHeight: 25,
                              cursorColor: StudentDesignSystem
                                  .config.colors.primaryPurple[500]!,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: StudentDesignSystem
                                        .config.colors.dark[300]!,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: StudentDesignSystem
                                        .config.colors.primaryPurple[500]!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (partAfter != null)
                          TextSpan(
                            text: partAfter,
                            style: TextStyles.bodyXLargeBold,
                          ),
                      ],
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
            onTap: _textFieldController.text.isNotEmpty
                ? () => widget.onAnswer(
                    partBefore + _textFieldController.text + (partAfter ?? ''))
                : null,
          ),
        )
      ],
    );
  }
}
