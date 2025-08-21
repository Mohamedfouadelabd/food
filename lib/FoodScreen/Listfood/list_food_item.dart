
import 'package:flutter/material.dart';
import 'package:food_app/Theme/my_Theme.dart';

class ListFoodItem extends StatelessWidget {

bool isSelected;
ListFoodItem({required this.isSelected});
@override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(10),
     margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
       color:isSelected?MyTheme.primary:Colors.transparent,
        border: Border.all(
          color: MyTheme.primary,
          width: 2
        ),
       borderRadius: BorderRadius.circular(10),

     ),

      child: Text('TexT',
      style: TextStyle(
        color: isSelected?MyTheme.white:MyTheme.primary,
      fontSize: 20,
        fontWeight: FontWeight.bold
      ),

      ),

    );
  }
}
