import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'snackbar.dart';

class ErrorHandler {
  ErrorHandler(this.key);

  final GlobalKey<NavigatorState> key;

  void handleError(dynamic error, {StackTrace? stack}) {
    var message = error.toString();
    var errorType = SnackbarType.info;

    // TODO: Handle flutter errors
    if (error is FlutterErrorDetails) {
      message = 'Ops! something went wrong!';
    }

    // TODO: Handle request errors
    if (error is DioError) {
      if (error.response!.statusCode != null &&
          error.response!.statusCode! >= 500) {
        message = 'There is something wrong with the server!';
        errorType = SnackbarType.error;

        showDialog(
          context: key.currentContext!,
          builder: (context) => AlertDialog(
            title: const Text('Server error'),
            content: const Text(
              'The server doesn\'t create a new record then we are not able to edit it. \nThat\'s why you are getting this error!',
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
      // TODO: Handle other errors from Dio
    }

    // TODO: Handle application errors

    showSnackbar(
      context: key.currentContext!,
      message: message,
      type: errorType,
    );
  }
}
