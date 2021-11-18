import 'dart:async';

import 'package:flutter/material.dart';
import 'package:global_configs/global_configs.dart';

import 'helpers/error_handler.dart';
import 'theme/app_theme.dart';
import 'theme/app_theme_data.dart';
import 'view/home_page.dart';

import 'config/app.dart' as configs;

void main() async {
  // Load configs
  GlobalConfigs().loadFromMap(configs.choiceByEnvironment('development'));

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final ErrorHandler errorHandler = ErrorHandler(navigatorKey);

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (error) => errorHandler.handleError(error);

    runApp(MyApp(navigatorKey: navigatorKey));
  }, (error, stack) => errorHandler.handleError(error, stack: stack));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.navigatorKey, Key? key}) : super(key: key);

  final GlobalKey<NavigatorState>? navigatorKey;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppTheme(
      theme: GlobalConfigs().get<AppThemeData>('appearance.theme.dark')!,
      child: Builder(builder: (context) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Todo list',
          theme: ThemeData(appBarTheme: AppTheme.of(context).appBarTheme),
          home: const HomePage(),
        );
      }),
    );
  }
}
