import 'package:flutter/material.dart';
import 'package:todo_list/theme/app_theme.dart';

enum SnackbarType { success, error, warning, info }

showSnackbar({
  required BuildContext context,
  required String message,
  required SnackbarType type,
}) {
  Color _backgroundColor;
  switch (type) {
    case SnackbarType.error:
      _backgroundColor = AppTheme.of(context).colorScheme.danger;
      break;
    case SnackbarType.success:
      _backgroundColor = AppTheme.of(context).colorScheme.success;
      break;
    default:
      _backgroundColor = AppTheme.of(context).colorScheme.danger;
  }
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: _backgroundColor,
    content: Text(message),
  ));
}
