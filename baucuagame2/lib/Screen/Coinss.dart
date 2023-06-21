import 'package:flutter/material.dart';

class Coinss extends StatelessWidget {
  Coinss({Key? key, required this.value, required this.colors})
      : super(key: key);
  int value;
  int colors;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.18,
      decoration:
          const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      child: Stack(
        children: [
          Image.asset(
            'assets/image/Coin$value.png',
            width: width * 0.18,
            fit: BoxFit.fill,
          ),
          Container(
            width: width * 0.18,
            decoration: BoxDecoration(
              color: colors==1?Colors.white.withOpacity(0):Colors.black.withOpacity(0.45),shape: BoxShape.circle
            ),
          )
        ],
      ),
    );
  }
}
