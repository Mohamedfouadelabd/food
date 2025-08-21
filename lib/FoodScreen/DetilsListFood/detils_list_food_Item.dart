

import 'package:flutter/material.dart';

import '../../Theme/my_Theme.dart';

class DetilsListFoodItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(5),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          color: MyTheme.primary, borderRadius: BorderRadius.circular(10)),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/img_4.png',
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '/////////////////////',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '/////////////////////',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '/////////////////////',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 5
                ),
                child: Image.asset('assets/images/img_3.png',
                  height: MediaQuery.of(context).size.height*0.03,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
