import 'package:flutter/material.dart';

import 'spacing_size.dart';

class SpaceVertical extends StatelessWidget {
  final double height;

  const SpaceVertical.x1({Key? key})
      : height = Spacing.x1,
        super(key: key);
  const SpaceVertical.x2({Key? key})
      : height = Spacing.x2,
        super(key: key);
  const SpaceVertical.x3({Key? key})
      : height = Spacing.x3,
        super(key: key);
  const SpaceVertical.x4({Key? key})
      : height = Spacing.x4,
        super(key: key);
  const SpaceVertical.x5({Key? key})
      : height = Spacing.x5,
        super(key: key);
  const SpaceVertical.x6({Key? key})
      : height = Spacing.x6,
        super(key: key);
  const SpaceVertical.x7({Key? key})
      : height = Spacing.x7,
        super(key: key);
  const SpaceVertical.x8({Key? key})
      : height = Spacing.x8,
        super(key: key);
  const SpaceVertical.x9({Key? key})
      : height = Spacing.x9,
        super(key: key);
  const SpaceVertical.x10({Key? key})
      : height = Spacing.x10,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
