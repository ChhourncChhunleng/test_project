import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
}
