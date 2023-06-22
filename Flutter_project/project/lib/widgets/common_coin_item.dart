import 'package:flutter/material.dart';

import '../constants/item_list.dart';

class CommonCoinItem extends StatelessWidget {
  final item_Class item;
  const CommonCoinItem({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 0.05,
      child: Container(
        alignment: Alignment.centerLeft,
        width: 50,
        decoration: const BoxDecoration(
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
