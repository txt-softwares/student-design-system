import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';
import '../../shared/head_question_widget.dart';
import 'reorder_list_widget.dart';

class ReorderQuestionTypeWidget extends StatefulWidget {
  const ReorderQuestionTypeWidget({
    Key? key,
    required this.options,
    required this.file,
    required this.title,
    required this.onAnswer,
  }) : super(key: key);

  final String? title;
  final String? file;
  final List<StudentTaskOptionModel> options;
  final Function(List<int> orderedIds) onAnswer;

  @override
  State<ReorderQuestionTypeWidget> createState() =>
      _OrderQuestionTypeWidgetState();
}

class _OrderQuestionTypeWidgetState extends State<ReorderQuestionTypeWidget> {
  var reorderedItems = <StudentTaskOptionModel>[];

  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = reorderedItems.removeAt(oldIndex);
    reorderedItems.insert(newIndex, item);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    reorderedItems = widget.options;
  }

  @override
  Widget build(BuildContext context) {
    final dsColor = StudentDesignSystem.config.colors;

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
              BoxText.bodyLargeSemiBold(
                'Segure e arraste para reordenar',
                color: StudentDesignSystem.config.colors.dark[500],
              ),
              const SpaceVertical.x6(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 72,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(right: 16),
                      itemBuilder: (context, index) =>
                          _buildItemBuilder(dsColor, index),
                      separatorBuilder: (context, index) =>
                          const SpaceVertical.x4(),
                      itemCount: reorderedItems.length,
                    ),
                  ),
                  ReorderListWidget(
                    reorderedItems: reorderedItems,
                    onReorder: onReorder,
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
            onTap: () =>
                widget.onAnswer(reorderedItems.map((e) => e.id).toList()),
          ),
        )
      ],
    );
  }

  Container _buildItemBuilder(StudentDSColors dsColor, int index) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: dsColor.transparentPurple,
        border: Border.all(
          color: dsColor.primaryPurple[100]!,
        ),
      ),
      child: Center(child: BoxText.bodyXLargeBold('${index + 1}')),
    );
  }
}
