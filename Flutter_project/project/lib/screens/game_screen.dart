import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:project/controllers/game_ctrl.dart';
import 'package:project/widgets/common_item.dart';
import 'package:provider/provider.dart';

import '../constants/item_list.dart';
import '../constants/list_bottom.dart';
import '../widgets/common_coin_item.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  AudioPlayer shakeClicker = AudioPlayer();
  AudioPlayer victory = AudioPlayer();
  AudioPlayer clickCoin = AudioPlayer();
  AudioPlayer clickCoins = AudioPlayer();
  AudioPlayer timeClick = AudioPlayer();
  AudioPlayer open = AudioPlayer();
  int totalMon = 1000;
  int time = 10;
  int count = 5;
  int d1 = 1;
  int d2 = 2;
  int d3 = 4;
  int tiger = 0;
  int klos = 0;
  int chicken = 0;
  int fish = 0;
  int crab = 0;
  int lobster = 0;
  int coinTurn = 1;
  int turnCoins = 0;
  int turnKlos = 0;
  int turnChecken = 0;
  int turnFish = 0;
  int turnCrab = 0;
  int turnLobster = 0;
  bool speed = false;
  bool show = false;
  bool shake = false;
  bool sound = true;
  bool click = true;
  bool select = false;
  double h = 0;
  double d = 0;
  double turn = 0;

  item_Class itemClass = item_Class(0);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<GameController>().suffleDice(d1, d2, d3);
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      
    });
    super.initState();
  }

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
        _buildTotalMoney(width, height),
        _buildSettime(height, width),
        _buildItem(height, width),
        // _buildBottomCoin(width, height),
        // _buildTableItem(height, width),
        _buildCoinBottom(width, height),
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
      bottom: height * 0.58,
      child: ShakeWidget(
        duration: const Duration(milliseconds: 500),
        shakeConstant: ShakeVerticalConstant1(),
        autoPlay: shake,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: height * 0.45,
                width: width * 0.6,
              ),
              //flat
              Positioned(
                bottom: 1,
                child: Image.asset(
                  'assets/image/Plate_.png',
                  height: width * 0.5,
                  width: width * 0.6,
                  fit: BoxFit.fill,
                ),
              ),
              //dic1
              Positioned(
                bottom: height * 0.151,
                left: width * 0.15,
                child: Image.asset(
                  'assets/image/d$d1.png',
                  height: d == 0 ? width * 0.14 : d,
                  width: d == 0 ? width * 0.14 : d,
                  fit: BoxFit.fill,
                ),
              ),
              //dic2
              Positioned(
                bottom: height * 0.07,
                left: width * 0.115,
                child: Image.asset(
                  'assets/image/d$d2.png',
                  height: d == 0 ? width * 0.14 : d,
                  width: d == 0 ? width * 0.14 : d,
                  fit: BoxFit.fill,
                ),
              ),
              //dic3
              Positioned(
                bottom: height * 0.1,
                left: width * 0.321,
                child: Image.asset(
                  'assets/image/d$d3.png',
                  height: d == 0 ? width * 0.14 : d,
                  width: d == 0 ? width * 0.14 : d,
                  fit: BoxFit.fill,
                ),
              ),
              //box
              Positioned(
                bottom: h == 0 ? height * 0.05 : h,
                left: width * 0.05,
                child: Image.asset(
                  'assets/image/Box.png',
                  height: width * 0.4,
                  width: width * 0.5,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettime(double height, double width) {
    return Positioned(
        top: height * 0.4,
        right: width * 0.01,
        child: Container(
            alignment: Alignment.center,
            height: width * 0.25,
            width: width * 0.4,
            child: Text(
              '$time',
              style: TextStyle(
                  fontSize: width * 0.2,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            )));
  }

  Widget _buildTotalMoney(double height, double width) {
    return Positioned(
      left: width * 0.017,
      bottom: height * 0.86,
      child: Stack(
        children: [
          Image.asset(
            'assets/image/Retangle.png',
            height: height * 0.2,
            width: width * 0.27,
            fit: BoxFit.fill,
          ),
          Positioned(
            // top: width * 0.17 / 2 - width * 0.06,
            bottom: height * 0.17,
            child: Image.asset(
              'assets/image/Gold.png',
              height: width * 0.08,
              width: width * 0.08,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: width * 0.17,
            width: width * 0.28,
            padding: EdgeInsets.only(bottom: height * 0.16),
            child: Text(
              '${totalMon}K',
              style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(double height, double width) {
    return Positioned(
      bottom: height * 0.17,
      right: 1,
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
        child: Container(
          padding: const EdgeInsets.all(7),
          width: width - width * 0.06,
          decoration:
              BoxDecoration(border: Border.all(width: 5, color: Colors.yellow)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //item 1 tiger
                  GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   ClickCoins();
                        //   if (cklic == true) {
                        //     if (coinTurn <= totalMon) {
                        //       item_class.tigerList.add(item_Class(coinTurn));
                        //       ++turnCoins;
                        //       tiger += coinTurn;
                        //       totalMon -= coinTurn;
                        //     }
                        //   }
                        // });
                      },
                      child: Stack(
                        children: [
                          CommonItem(
                              d1: d1,
                              d2: d2,
                              d3: d3,
                              image: 'b1',
                              image2: 'b1a',
                              item: 1,
                              show: show),
                          Positioned(
                            bottom: -width * 0.05,
                            child: Container(
                              alignment: Alignment.center,
                              height: width * 0.24,
                              width: width * 0.24,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: turnCoins,
                                reverse: true,
                                itemBuilder: (BuildContext context, int index) {
                                  var data = itemClass.tigerList[index];
                                  return index == 0
                                      ? const Text('')
                                      : CommonCoinItem(item: data);
                                },
                              ),
                            ),
                          ),
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        // ClickCoins();
                        // setState(() {
                        //   if (click == true) {
                        //     if (coinTurn <= totalMon) {
                        //       item_class.klosList.add(item_Class(coinTurn));
                        //       ++turnKlos;

                        //       klos += coinTurn;
                        //       totalMon -= coinTurn;
                        //     }
                        //   }
                        // });
                      },
                      child: Stack(
                        children: [
                          CommonItem(
                              d1: d1,
                              d2: d2,
                              d3: d3,
                              image: 'b2',
                              image2: 'b2a',
                              item: 2,
                              show: show),
                          Positioned(
                            bottom: -width * 0.05,
                            child: Container(
                              height: width * 0.24,
                              width: width * 0.24,
                              alignment: Alignment.bottomCenter,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: turnKlos,
                                reverse: true,
                                itemBuilder: (BuildContext context, int index) {
                                  var data = itemClass.klosList[index];
                                  return index == 0
                                      ? const Text('')
                                      : CommonCoinItem(item: data);
                                },
                              ),
                            ),
                          ),
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          // ClickCoins();
                          // if (click == true) {
                          //   if (coinTurn <= totalMon) {
                          //     ++turnChecken;
                          //     item_class.chickenList.add(item_Class(coinTurn));
                          //     chicken += coinTurn;
                          //     totalMon -= coinTurn;
                          //   }
                          // }
                        });
                      },
                      child: Stack(
                        children: [
                          CommonItem(
                              d1: d1,
                              d2: d2,
                              d3: d3,
                              image: 'b3',
                              image2: 'b3a',
                              item: 3,
                              show: show),
                          Positioned(
                            bottom: -width * 0.05,
                            child: Container(
                              height: width * 0.24,
                              width: width * 0.24,
                              alignment: Alignment.bottomCenter,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: turnChecken,
                                reverse: true,
                                itemBuilder: (BuildContext context, int index) {
                                  var data = itemClass.chickenList[index];
                                  return index == 0
                                      ? const Text('')
                                      : CommonCoinItem(item: data);
                                },
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              SizedBox(height: height * 0.025),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.01, right: width * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            // ClickCoins();
                            if (click == true) {
                              if (coinTurn <= totalMon) {
                                ++turnFish;
                                itemClass.fishList.add(item_Class(coinTurn));
                                fish += coinTurn;
                                totalMon -= coinTurn;
                              }
                            }
                          });
                        },
                        child: Stack(
                          children: [
                            CommonItem(
                                d1: d1,
                                d2: d2,
                                d3: d3,
                                image: 'b4',
                                image2: 'b4a',
                                item: 4,
                                show: show),
                            Positioned(
                              bottom: -width * 0.05,
                              child: Container(
                                height: width * 0.24,
                                width: width * 0.24,
                                alignment: Alignment.bottomCenter,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: turnFish,
                                  reverse: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var data = itemClass.fishList[index];
                                    return index == 0
                                        ? const Text('')
                                        : CommonCoinItem(item: data);
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            // ClickCoins();
                            if (click == true) {
                              if (coinTurn <= totalMon) {
                                ++turnCrab;
                                itemClass.crapList.add(item_Class(coinTurn));
                                crab += coinTurn;
                                totalMon -= coinTurn;
                              }
                            }
                          });
                        },
                        child: Stack(
                          children: [
                            CommonItem(
                                d1: d1,
                                d2: d2,
                                d3: d3,
                                image: 'b5',
                                image2: 'b5a',
                                item: 5,
                                show: show),
                            Positioned(
                              bottom: -width * 0.05,
                              child: Container(
                                height: width * 0.24,
                                width: width * 0.24,
                                alignment: Alignment.bottomCenter,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: turnCrab,
                                  reverse: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var data = itemClass.crapList[index];
                                    return index == 0
                                        ? const Text('')
                                        : CommonCoinItem(item: data);
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            // ClickCoins();
                            if (click == true) {
                              if (coinTurn <= totalMon) {
                                ++turnLobster;
                                itemClass.lobsterList.add(item_Class(coinTurn));
                                lobster += coinTurn;
                                totalMon -= coinTurn;
                              }
                            }
                          });
                        },
                        child: Stack(
                          children: [
                            CommonItem(
                                d1: d1,
                                d2: d2,
                                d3: d3,
                                image: 'b6',
                                image2: 'b6a',
                                item: 6,
                                show: show),
                            Positioned(
                              bottom: -width * 0.05,
                              child: Container(
                                height: width * 0.24,
                                width: width * 0.24,
                                alignment: Alignment.bottomCenter,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: turnLobster,
                                  reverse: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var data = itemClass.lobsterList[index];
                                    return index == 0
                                        ? const Text('')
                                        : CommonCoinItem(item: data);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableItem(double height, double width) {
    return Positioned(
      bottom: height * 0.17,
      right: 1,
      child: Container(
        padding: const EdgeInsets.all(7),
        margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
        child: Container(
          padding: const EdgeInsets.all(7),
          width: width - width * 0.06,
          decoration:
              BoxDecoration(border: Border.all(width: 5, color: Colors.yellow)),
          // child: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder),
        ),
      ),
    );
  }

  Widget _buildCoinBottom(double width, double height) {
    return Positioned(
      bottom: height * 0.03,
      left: width * 0.025,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(listBottom.length, (index) {
          var data = listBottom[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                listBottom[index]['select'] = !listBottom[index]['select'];
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              width: width * 0.18,
              decoration: BoxDecoration(
                  color: data['select']
                      ? Colors.white.withOpacity(0)
                      : Colors.black.withOpacity(0.45),
                  border: Border.all(
                      width: 2,
                      color: data['select'] ? Colors.blue : Colors.white),
                  shape: BoxShape.circle),
              child: Image.asset(listBottom[index]['img']),
            ),
          );
        }),
      ),
    );
  }
}
