import 'package:flutter/material.dart';

class DialogUtils {
  static void showDialogMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('ok'))
        ],
      ),
    );
  }
}