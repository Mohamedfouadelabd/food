
import 'package:flutter/material.dart';

import '../../Theme/my_Theme.dart';
import '../../model/CountrySourceResponse.dart';

class ItemListArea extends StatelessWidget {
  Area area;
  bool isSelected;
  ItemListArea({required this.isSelected,required this.area});
  @override
  Widget build(BuildContext context) {
    return  Container(
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

      child: Text(area.strArea??"",
        style: TextStyle(
            color: isSelected?MyTheme.white:MyTheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),

      ),

    );
  }
}
