import 'dart:async';

import 'package:baucuagame2/Screen/HomePage.dart';
import 'package:flutter/material.dart';

class SlashPage extends StatefulWidget {
  const SlashPage({Key? key}) : super(key: key);

  @override
  State<SlashPage> createState() => _SlashPageState();
}

class _SlashPageState extends State<SlashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Image.asset(
          'assets/image/Interface BẦU CUA_.png',
          height: height,
          width: width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
