import 'package:flutter/material.dart';

import 'item_Class.dart';

class Coin_Item extends StatelessWidget {
   Coin_Item({Key? key,required this.item}) : super(key: key);
   item_Class item;
  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 0.05,
      child: Container(
        alignment: Alignment.centerLeft,
        width: 50,
        decoration:  BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          'assets/image/Coin${item.i}.png',
          width: 50,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
