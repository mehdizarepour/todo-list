import 'package:flutter/material.dart';
import 'package:todo_list/theme/app_theme.dart';
import 'package:todo_list/theme/app_theme_data.dart';

class TaskInputWidget extends StatelessWidget {
  const TaskInputWidget({
    Key? key,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.controller,
  }) : super(key: key);

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.of(context).colorScheme.backgroundSecondary,
        ),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          onSaved: onSaved,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          cursorColor: AppTheme.of(context).colorScheme.textPrimary,
          style: AppTheme.of(context).typography(TextType.headline5),
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorStyle: const TextStyle(height: 0),
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            hintText: 'Add new task...',
            hintStyle: AppTheme.of(context).typography(TextType.subtitle2),
            prefixIcon: Icon(
              Icons.add,
              color: AppTheme.of(context).colorScheme.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
