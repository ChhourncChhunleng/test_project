import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool sound = true;
  bool shake = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          'assets/image/Interface inside BẦU CUA copy.png',
          height: height,
          width: width,
          fit: BoxFit.fill,
        ),
        _buildReplayButton(width),
        _buildSoundButton(width),
        _buildPlateDice(width, height),
      ],
    );
  }

  Widget _buildReplayButton(double width) {
    return Positioned(
      top: 10,
      left: 10,
      child: GestureDetector(
        onTap: () {
          // setState(() {
          //   show = false;
          //   count =4;
          //   totalMon = 1000;
          //   removeItemList();
          //   removeList();
          //   time = 15;

          // });
        },
        child: Image.asset(
          'assets/image/replay.png',
          height: width * 0.2,
          width: width * 0.2,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildSoundButton(double width) {
    return Positioned(
      top: 10,
      right: 10,
      child: GestureDetector(
        onTap: () {
          sound = !sound;
        },
        child: sound == true
            ? Image.asset(
                'assets/image/sound.png',
                height: width * 0.15,
                width: width * 0.15,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/image/soundno.png',
                height: width * 0.15,
                width: width * 0.15,
                fit: BoxFit.fill,
              ),
      ),
    );
  }

  Widget _buildPlateDice(double width, double height) {
    return Positioned(
      left: width / 2 - width * 0.3,
      child: ShakeWidget(
        duration: const Duration(milliseconds: 500),
        shakeConstant: ShakeVerticalConstant1(),
        autoPlay: shake,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Stack(
            clipBehavior: Clip.none,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
