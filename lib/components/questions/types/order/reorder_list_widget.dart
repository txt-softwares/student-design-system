import 'package:flutter/material.dart';
import '../../../../student_design_system.dart';
import 'item_option_widget.dart';

class ReorderListWidget extends StatelessWidget {
  const ReorderListWidget({
    super.key,
    required this.reorderedItems,
    required this.onReorder,
  });
  final List<StudentTaskOptionModel> reorderedItems;
  final Function(int oldIndex, int newIndex) onReorder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReorderableListView.builder(
        proxyDecorator: _buildProxyDecorator,
        itemCount: reorderedItems.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ReorderOptionWidget(
            option: reorderedItems[index],
            key: Key(reorderedItems[index].id.toString()),
          );
        },
        shrinkWrap: true,
        onReorder: onReorder,
      ),
    );
  }

  Widget _buildProxyDecorator(
    Widget child,
    int index,
    Animation<double> animation,
  ) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Card(
          elevation: 0,
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                StudentDesignSystem.config.borderRadius,
              ),
              border: Border.all(
                  color: StudentDesignSystem.config.colors.dark[200]!),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child:
                        BoxText.bodyXLargeBold(reorderedItems[index].content),
                  ),
                ),
                Icon(
                  Icons.drag_handle_rounded,
                  color: StudentDesignSystem.config.colors.dark[500],
                ),
              ],
            ),
          ),
        );
      },
      child: child,
    );
  }
}
