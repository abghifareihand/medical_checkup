import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final String message;
  final Function() onPressed;

  const CustomAlert({
    super.key,
    required this.title,
    required this.message, 
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Text(title),
      content: Text(message),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text('OK'),
          ),
        ),
      ],
    );
  }
}