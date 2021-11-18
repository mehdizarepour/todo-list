import 'package:flutter/material.dart';
import 'package:todo_list/theme/app_theme.dart';
import 'package:todo_list/theme/app_theme_data.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    Key? key,
    required this.color,
    required this.lable,
  }) : super(key: key);

  final Color color;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      width: 75,
      decoration: BoxDecoration(
        color: color.withOpacity(0.25),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          lable,
          style: AppTheme.of(context).typography(
            TextType.subtitle1,
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}
