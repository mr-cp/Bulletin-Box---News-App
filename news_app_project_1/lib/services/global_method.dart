import 'package:flutter/material.dart';

class GlobalMethod {
  static Future<void> errDialogue(
      {required String errorMessage, required BuildContext context}) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(errorMessage),
          title: const Row(
            children: [
              Icon(Icons.dangerous_outlined),
              SizedBox(width: 5),
              Text('an error occured')
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Ok'),
            )
          ],
        );
      },
    );
  }
}
