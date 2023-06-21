import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool shake = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/image/Interface BẦU CUA_.png',
              height: height,
              width: width,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: height * 0.15,
              left: width / 2 - width * 0.25,
              child: ShakeWidget(
                duration: const Duration(seconds: 2),
                shakeConstant: ShakeChunkConstant(),
                autoPlay: shake,
                child: Image.asset(
                  'assets/image/Iconss.png',
                  height: width * 0.5,
                  width: width * 0.5,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: height * 0.55,
              left: width / 2 - width * 0.2,
              child: GestureDetector(
                onTap: () {
                  shake = false;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameScreen()));
                },
                child: ShakeWidget(
                  duration: const Duration(seconds: 5),
                  shakeConstant: ShakeVerticalConstant1(),
                  autoPlay: true,
                  child: Image.asset(
                    'assets/image/Button Play.png',
                    height: height * 0.1,
                    width: width * 0.4,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.75,
              left: width / 2 - width * 0.2,
              child: GestureDetector(
                onTap: () {
                  shake = false;
                  SystemNavigator.pop();
                },
                child: ShakeWidget(
                  duration: const Duration(seconds: 5),
                  shakeConstant: ShakeVerticalConstant1(),
                  autoPlay: true,
                  child: Image.asset(
                    'assets/image/Button Quit.png',
                    height: height * 0.1,
                    width: width * 0.4,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
