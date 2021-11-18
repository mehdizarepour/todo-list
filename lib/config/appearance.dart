import 'package:flutter/material.dart';
import 'package:todo_list/theme/app_theme_data.dart';

final Map<String, dynamic> appearance = {
  'defaultTheme': 'dark',
  'theme': {'dark': defaultTheme, 'light': lightTheme}
};

const defaultTheme = AppThemeData(
  fontFamily: 'Nunito',
  colorScheme: _darkColorScheme,
  textTheme: _textTheme,
  appBarTheme: _appDarkBarTheme,
);

const lightTheme = AppThemeData(
  fontFamily: 'Nunito',
  colorScheme: _lightColorScheme,
  textTheme: _textTheme,
  appBarTheme: _appLightBarTheme,
);

const _appDarkBarTheme = AppBarTheme(
  color: Color(0XFF2A2B2F),
  centerTitle: false,
);

const _appLightBarTheme = AppBarTheme(
  color: Color(0XFFFCFCFC),
  centerTitle: false,
);

const _darkColorScheme = AppColorScheme(
  primary: Color(0xFF66A1F0),
  secondary: Color(0xFFF3D5DB),
  background: Color(0xFF0F0F10),
  backgroundSecondary: Color(0XFF2A2B2F),
  danger: Color(0xffD10D0D),
  success: Color(0xff0DD148),
  textPrimary: Color(0xFFD0D6E3),
  textSecondary: Color(0xffD0D6E3),
);

const _lightColorScheme = AppColorScheme(
  primary: Color(0xFF66A1F0),
  secondary: Color(0xFFF3D5DB),
  background: Color(0xFFF6F5F0),
  backgroundSecondary: Color(0XFFFCFCFC),
  danger: Color(0xffD10D0D),
  success: Color(0xff0DD148),
  textPrimary: Colors.black,
  textSecondary: Colors.black,
);

const _textTheme = TextTheme(
  /// Sub titles
  subtitle1: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: Color(0xFFD0D6E3),
  ),

  subtitle2: TextStyle(
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    fontSize: 12,
    color: Color(0xFFD0D6E3),
  ),

  /// Titles
  headline1: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Color(0xFF171725),
  ),

  /// Labels
  headline2: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Color(0xFFD0D6E3),
  ),

  /// Texts
  bodyText1: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Color(0xFF171725),
  ),

  /// Buttons Text
  button: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: Color(0xFF454545),
  ),

  /// Input text
  headline4: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: Color(0xFFD0D6E3),
  ),

  /// Input lable
  headline3: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Color(0xFFD0D6E3),
  ),

  /// Card Title
  headline5: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Color(0xFFD0D6E3),
  ),
);
