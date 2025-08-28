import 'package:flutter/material.dart';

import '../Theme/my_theme.dart';

class DailogUtils {
  static void showLoading(BuildContext context, String massage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: MyTheme.white,
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: MyTheme.black,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(massage),
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMassage(
    BuildContext context,
    String massage, {
    String titel = 'titel',
    VoidCallback? posAc,
    VoidCallback? negAc,
    String? posActionName,
    String? negActionName,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          posAc?.call();
        },
        child: Text(posActionName,
        style: Theme.of(context).textTheme.titleMedium),
      ));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAc!.call();
          },
          child: Text(negActionName)));
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: MyTheme.white,
            content: Text(massage),
            title: Text(
              titel,
              style: TextStyle(color: MyTheme.black, fontSize: 20),
            ),
            actions: actions,
            titleTextStyle: TextStyle(color: MyTheme.black, fontSize: 20),
          );
        });
  }
}
