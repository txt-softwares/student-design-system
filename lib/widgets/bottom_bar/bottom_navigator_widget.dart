import 'package:flutter/material.dart';
import '../../spacing/space_vertical_widget.dart';
import '../image/picture_widget.dart';
import 'bottom_item_bar.dart';

class BottomBarWidget extends StatefulWidget {
  final ValueChanged<int> onTabSelected;
  final List<BottomBarItem> items;
  final int selectedIndex;

  const BottomBarWidget({
    required this.onTabSelected,
    required this.items,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: BottomAppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              widget.items.length,
              (i) {
                return _buildTabIcon(
                  index: i,
                  item: widget.items[i],
                  onPressed: widget.onTabSelected,
                  context: context,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabIcon({
    required int index,
    required BottomBarItem item,
    required ValueChanged<int> onPressed,
    required BuildContext context,
  }) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => onPressed(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: StudentPictureWidget.asset(item.icon),
            ),
            const SpaceVertical.x1(),
            Text(
              item.title,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
