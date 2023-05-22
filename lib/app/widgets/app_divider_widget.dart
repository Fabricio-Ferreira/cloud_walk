import 'package:cloud_walk_test/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class AppDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 1,
        color: AppColorScheme.border,
      );
}
