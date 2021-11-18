import 'package:flutter/material.dart';

enum TextType {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  bodyText1,
  button,
}

enum ColorStyle {
  primary,
  secondary,
  textPrimary,
  textSecondary,
  background,
  backgroundSecondary,
  success,
  danger,
}

class AppThemeData {
  final String fontFamily;
  final AppColorScheme colorScheme;
  final TextTheme textTheme;
  final AppBarTheme appBarTheme;

  const AppThemeData({
    required this.fontFamily,
    required this.colorScheme,
    required this.textTheme,
    required this.appBarTheme,
  });

  TextStyle typography(
    TextType text, {
    ColorStyle? color = ColorStyle.textPrimary,
    TextStyle? style,
  }) {
    TextStyle _selectedStyle;

    // Select base text style
    switch (text) {
      case TextType.headline1:
        _selectedStyle = textTheme.headline1!;
        break;
      case TextType.headline2:
        _selectedStyle = textTheme.headline2!;
        break;
      case TextType.headline3:
        _selectedStyle = textTheme.headline3!;
        break;
      case TextType.headline4:
        _selectedStyle = textTheme.headline4!;
        break;
      case TextType.headline5:
        _selectedStyle = textTheme.headline5!;
        break;
      case TextType.headline6:
        _selectedStyle = textTheme.headline6!;
        break;
      case TextType.subtitle1:
        _selectedStyle = textTheme.subtitle1!;
        break;
      case TextType.subtitle2:
        _selectedStyle = textTheme.subtitle2!;
        break;
      case TextType.bodyText1:
        _selectedStyle = textTheme.bodyText1!;
        break;
      case TextType.button:
        _selectedStyle = textTheme.button!;
        break;
      default:
        _selectedStyle = textTheme.headline6!;
    }

    // Select new color
    switch (color) {
      case ColorStyle.secondary:
        _selectedStyle = _selectedStyle.copyWith(color: colorScheme.secondary);
        break;
      case ColorStyle.primary:
        _selectedStyle = _selectedStyle.copyWith(color: colorScheme.primary);
        break;
      case ColorStyle.textPrimary:
        _selectedStyle =
            _selectedStyle.copyWith(color: colorScheme.textPrimary);
        break;
      case ColorStyle.textSecondary:
        _selectedStyle =
            _selectedStyle.copyWith(color: colorScheme.textSecondary);
        break;
      case ColorStyle.background:
        _selectedStyle = _selectedStyle.copyWith(color: colorScheme.background);
        break;
      case ColorStyle.backgroundSecondary:
        _selectedStyle =
            _selectedStyle.copyWith(color: colorScheme.backgroundSecondary);
        break;
      case ColorStyle.success:
        _selectedStyle = _selectedStyle.copyWith(color: colorScheme.success);
        break;
      case ColorStyle.danger:
        _selectedStyle = _selectedStyle.copyWith(color: colorScheme.danger);
        break;
      default:
    }

    // Merge with custom style
    if (style != null) {
      return _selectedStyle.merge(style);
    }

    return _selectedStyle;
  }
}

class AppColorScheme {
  final Color primary;
  final Color secondary;
  final Color textPrimary;
  final Color textSecondary;
  final Color background;
  final Color backgroundSecondary;
  final Color danger;
  final Color success;

  const AppColorScheme({
    required this.primary,
    required this.secondary,
    required this.textPrimary,
    required this.textSecondary,
    required this.background,
    required this.backgroundSecondary,
    required this.success,
    required this.danger,
  });
}
