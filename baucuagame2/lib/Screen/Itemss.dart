import 'package:flutter/material.dart';

class itemss extends StatelessWidget {
  itemss({Key? key,required this.d1,required this.d2,required this.d3,required this.image,required this.image2,required this.item,required this.show}) : super(key: key);
  int d1,d2,d3,item;
  String image,image2;
  bool show;
  bool Condi(int item) {
    if (d1 == item || d2 == item || d3 == item) {
      return true;
    } else {
      return false;
    }
  }
  bool Condi2(int item) {
    if (Condi(item) == true && show == true) {
      return true;
    } else {
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      height: width * 0.24,
      width: width * 0.24,
      child: Condi2(item) == false
          ? Image.asset(
        'assets/image/$image.png',
        height: width * 0.24,
        width: width * 0.24,
        fit: BoxFit.fill,
      )
          : Image.asset(
        'assets/image/$image2.png',
        height: width * 0.24,
        width: width * 0.24,
        fit: BoxFit.fill,
      ),
    );
  }
}
