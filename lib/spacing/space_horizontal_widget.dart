import 'package:flutter/material.dart';

import 'spacing_size.dart';

class SpaceHorizontal extends StatelessWidget {
  final double width;

  const SpaceHorizontal.x1({Key? key})
      : width = Spacing.x1,
        super(key: key);
  const SpaceHorizontal.x2({Key? key})
      : width = Spacing.x2,
        super(key: key);
  const SpaceHorizontal.x3({Key? key})
      : width = Spacing.x3,
        super(key: key);
  const SpaceHorizontal.x4({Key? key})
      : width = Spacing.x4,
        super(key: key);
  const SpaceHorizontal.x5({Key? key})
      : width = Spacing.x5,
        super(key: key);
  const SpaceHorizontal.x6({Key? key})
      : width = Spacing.x6,
        super(key: key);
  const SpaceHorizontal.x7({Key? key})
      : width = Spacing.x7,
        super(key: key);
  const SpaceHorizontal.x8({Key? key})
      : width = Spacing.x8,
        super(key: key);
  const SpaceHorizontal.x9({Key? key})
      : width = Spacing.x9,
        super(key: key);
  const SpaceHorizontal.x10({Key? key})
      : width = Spacing.x10,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
