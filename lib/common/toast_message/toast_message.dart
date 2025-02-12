import 'package:flutter/material.dart';

class ToastMessage {
  static void show({
    required String message,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
