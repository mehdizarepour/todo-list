import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme_data.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData theme;

  const AppTheme({Key? key, required Widget child, required this.theme})
      : super(key: key, child: child);

  static AppThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AppTheme>()!.theme;
    return theme;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return oldWidget.theme != theme;
  }
}
