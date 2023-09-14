import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GlobalMethod {

  static String formattedDateText(String publishedAt){
    final parsedData = DateTime.parse(publishedAt);
    final formattedDate = DateFormat('M/d/yy   h:m:s a').format(parsedData);
    //DateTime publisheDate =  
    return formattedDate;
    }

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
