

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
String titel;
CustomText({required this.titel});
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(titel,
        style: Theme.of(context).textTheme.titleMedium,

      ),
    );
  }
}
