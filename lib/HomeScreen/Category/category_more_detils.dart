
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Theme/my_Theme.dart';
import '../../model/AllCategorySourceResponse.dart';
import '../custom_Text.dart';

class CategoryMoreDetils extends StatelessWidget {
static const String routeName='category_more_detils';

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)!.settings.arguments as   Categories ;
    return Scaffold(
      appBar: AppBar(
         title: Text(
           'More Details....',
           style: Theme.of(context).textTheme.titleLarge,
         ),

      ),
   body: SingleChildScrollView(
     child: Column(
       children: [
         Container(
           padding: EdgeInsets.all(5),
           margin: EdgeInsets.all(5),

           decoration: BoxDecoration(

           ),
           child:Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               CachedNetworkImage(
                 height: MediaQuery.of(context).size.height*0.31,
                width: double.infinity,
                 fit: BoxFit.cover,
                 imageUrl:args.strCategoryThumb??"",
                 placeholder: (context, url) => CircularProgressIndicator(
                   color: MyTheme.primary,
                 ),
                 errorWidget: (context, url, error) => Icon(Icons.error),
               ),

Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text('Description',

  style: Theme.of(context).textTheme.titleLarge!.copyWith(

      color: MyTheme.primary

  ),



  ),
),
               CustomText(titel: args.strCategoryDescription??""),

             ],


           ),
         ),

       ],
     ),
   ),
    );
  }
}
