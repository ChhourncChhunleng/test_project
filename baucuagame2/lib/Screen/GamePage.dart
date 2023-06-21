import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:baucuagame2/Screen/Coin_Item.dart';
import 'package:baucuagame2/Screen/Coinss.dart';
import 'package:baucuagame2/Screen/Itemss.dart';
import 'package:baucuagame2/Screen/item_Class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    suffleDice();
    WidgetsBinding.instance.addObserver(this);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        SetTimerAction();
        print('$time');
      });
    });
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    sound = false;

    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // The app is going into the background, pause the audio
      sound = false;
    } else if (state == AppLifecycleState.resumed) {
      // The app is coming back from the background, resume the audio
      sound = true;
    }
  }
  void SetTimerAction() {
    TimeClick();

    if (show == true) {
      count--;
      if (count == 3) {

        d = 95;
        h = 300;
        Victory();
      } else if (count == 4) {
        //d1=4;d2=4;d3=4;
        //

      } else if (count == 0) {
        caculer();
        suffleDice();
        Open();
        removeItemList();
        removeList();
        show = false;
        time = 10;
        d = 0;
        h = 0;
      }
    } else {
      time--;
      if (time == 0) {
        turn = 0;
        count = 4;

        show = true;
        Open();
      } else {
        if (time <= 2) {
          click = false;
        }
        if (time <= 8) {
          shake = false;
        } else {
          click = true;
          ShakeClick();
          shake = true;
        }
      }
    }
  }

  void removeItemList() {
    tiger = 0;
    klos = 0;
    chicken = 0;
    fish = 0;
    crab = 0;
    lobster = 0;
    turnCoins = 0;
    turnKlos = 0;
    turnChecken = 0;
    turnFish = 0;
    turnCrab = 0;
    turnLobster = 0;
  }

  void removeList() {
    item_class.tigerList.removeRange(0, item_class.tigerList.length);
    item_class.klosList.removeRange(0, item_class.klosList.length);
    item_class.chickenList.removeRange(0, item_class.chickenList.length);
    item_class.fishList.removeRange(0, item_class.fishList.length);
    item_class.crapList.removeRange(0, item_class.crapList.length);
    item_class.lobsterList.removeRange(0, item_class.lobsterList.length);
    item_class.tigerList.add(item_Class(0));
    item_class.klosList.add(item_Class(0));
    item_class.chickenList.add(item_Class(0));
    item_class.fishList.add(item_Class(0));
    item_class.crapList.add(item_Class(0));
    item_class.lobsterList.add(item_Class(0));
    turnCoins = 1;
    turnKlos = 1;
    turnChecken = 1;
    turnFish = 1;
    turnCrab = 1;
    turnLobster = 1;
  }

  void ClickCoin() {
    if (sound == true) {
      clickCoin.play(AssetSource('Coin9.mp3'));
    } else {
      clickCoin.stop();
    }
  }

  void ClickCoins() {
    if (sound == true) {
      clickCoins.play(AssetSource('coinsplash.mp3'));
    } else {
      clickCoins.stop();
    }
  }

  void TimeClick() {
    if (sound == true) {
      timeClick.play(AssetSource('changBet.mp3'));
    } else {
      timeClick.stop();
    }
  }

  void Open() {
    if (sound == true) {
      open.play(AssetSource('opencover.mp3'));
    } else {
      open.stop();
    }
  }

  void ShakeClick() {
    if (sound == true) {
      shakeClicker.play(AssetSource('shake.mp3'));
    } else {
      shakeClicker.stop();
    }
  }

  void Victory() {
    if (sound == true) {
      victory.play(AssetSource('victory.mp3'));
    } else {
      victory.stop();
    }
  }

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
  double h = 0;
  double d = 0;
  double turn = 0;
  item_Class item_class = item_Class(0);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/image/Interface inside BẦU CUA copy.png',
              height: height,
              width: width,
              fit: BoxFit.fill,
            ),
            //Setting
            ReplayButton(width),
            //Sound
            SoundButton(width),
            //plate
            PlateDice(width, height),
            //Time
            Positioned(
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
                    ))),
            //Total Money
            TotalMoney(width, height),
            // table
            TableItem(height, width),
            //buttom coin
            ButtomCoin(height, width)
          ],
        ),
      ),
    );
  }

  Positioned ReplayButton(double width) {
    return Positioned(
      top: 10,
      left: 10,
      child: GestureDetector(
        onTap: () {
          setState(() {
            show = false;
            count =4;
            totalMon = 1000;
            removeItemList();
            removeList();
            time = 15;

          });
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

  Positioned SoundButton(double width) {
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

  Positioned PlateDice(double width, double height) {
    return Positioned(
      //top: height * 0.25,
      left: width / 2 - width * 0.3,
      child: ShakeWidget(
        duration: const Duration(milliseconds: 500),
        shakeConstant: ShakeVerticalConstant1(),
        autoPlay: shake,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: height * 0.45,
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

  Positioned TotalMoney(double width, double height) {
    return Positioned(
      left: width * 0.03,
      bottom: height * 0.48,
      child: Stack(
        children: [
          Image.asset(
            'assets/image/Retangle.png',
            height: width * 0.17,
            width: width * 0.54,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: width * 0.17 / 2 - width * 0.06,
            child: Image.asset(
              'assets/image/Gold.png',
              height: width * 0.12,
              width: width * 0.12,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: width * 0.17,
            width: width * 0.54,
            child: Text(
              '${totalMon}K',
              style: TextStyle(
                  fontSize: width * 0.06,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Positioned TableItem(double height, double width) {
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
                        setState(() {
                          ClickCoins();
                          if (click == true) {
                            if (coinTurn <= totalMon) {
                              item_class.tigerList.add(item_Class(coinTurn));
                              ++turnCoins;
                              tiger += coinTurn;
                              totalMon -= coinTurn;
                            }
                          }
                        });
                      },
                      child: Stack(
                        children: [
                          itemss(
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
                                  var data = item_class.tigerList[index];
                                  return index == 0
                                      ? const Text('')
                                      : Coin_Item(item: data);
                                },
                              ),
                            ),
                          ),
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        ClickCoins();
                        setState(() {
                          if (click == true) {
                            if (coinTurn <= totalMon) {
                              item_class.klosList.add(item_Class(coinTurn));
                              ++turnKlos;

                              klos += coinTurn;
                              totalMon -= coinTurn;
                            }
                          }
                        });
                      },
                      child: Stack(
                        children: [
                          itemss(
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
                                  var data = item_class.klosList[index];
                                  return index == 0
                                      ? const Text('')
                                      : Coin_Item(item: data);
                                },
                              ),
                            ),
                          ),
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          ClickCoins();
                          if (click == true) {
                            if (coinTurn <= totalMon) {
                              ++turnChecken;
                              item_class.chickenList.add(item_Class(coinTurn));
                              chicken += coinTurn;
                              totalMon -= coinTurn;
                            }
                          }
                        });
                      },
                      child: Stack(
                        children: [
                          itemss(
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
                                  var data = item_class.chickenList[index];
                                  return index == 0
                                      ? const Text('')
                                      : Coin_Item(item: data);
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
                            ClickCoins();
                            if (click == true) {
                              if (coinTurn <= totalMon) {
                                ++turnFish;
                                item_class.fishList.add(item_Class(coinTurn));
                                fish += coinTurn;
                                totalMon -= coinTurn;
                              }
                            }
                          });
                        },
                        child: Stack(
                          children: [
                            itemss(
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
                                    var data = item_class.fishList[index];
                                    return index == 0
                                        ? const Text('')
                                        : Coin_Item(item: data);
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            ClickCoins();
                            if (click == true) {
                              if (coinTurn <= totalMon) {
                                ++turnCrab;
                                item_class.crapList.add(item_Class(coinTurn));
                                crab += coinTurn;
                                totalMon -= coinTurn;
                              }
                            }
                          });
                        },
                        child: Stack(
                          children: [
                            itemss(
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
                                    var data = item_class.crapList[index];
                                    return index == 0
                                        ? const Text('')
                                        : Coin_Item(item: data);
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            ClickCoins();
                            if (click == true) {
                              if (coinTurn <= totalMon) {
                                ++turnLobster;
                                item_class.lobsterList
                                    .add(item_Class(coinTurn));
                                lobster += coinTurn;
                                totalMon -= coinTurn;
                              }
                            }
                          });
                        },
                        child: Stack(
                          children: [
                            itemss(
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
                                    var data = item_class.lobsterList[index];
                                    return index == 0
                                        ? const Text('')
                                        : Coin_Item(item: data);
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

  Positioned ButtomCoin(double height, double width) {
    return Positioned(
      bottom: height * 0.03,
      left: width * 0.025,
      child: Container(
        height: width * 0.18,
        width: width * 0.95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  ClickCoin();
                  coinTurn = 1;
                });
              },
              child: Container(
                width: width * 0.18,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child: Coinss(value: 1, colors: coinTurn == 1 ? 1 : 0),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ClickCoin();
                  coinTurn = 5;
                });
              },
              child: Container(
                width: width * 0.18,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child: Coinss(value: 5, colors: coinTurn == 5 ? 1 : 0),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ClickCoin();
                  coinTurn = 10;
                });
              },
              child: Container(
                width: width * 0.18,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child: Coinss(value: 10, colors: coinTurn == 10 ? 1 : 0),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ClickCoin();
                  coinTurn = 50;
                });
              },
              child: Container(
                width: width * 0.18,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child: Coinss(value: 50, colors: coinTurn == 50 ? 1 : 0),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ClickCoin();
                  coinTurn = 100;
                });
              },
              child: Container(
                width: width * 0.18,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child: Coinss(value: 100, colors: coinTurn == 100 ? 1 : 0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void suffleDice() {
    var random = Random();
    var i1 = random.nextInt(6) + 1;
    d1 = i1;
    var i2 = random.nextInt(6) + 1;
    d2 = i2;
    var i3 = random.nextInt(6) + 1;
    d3 = i3;
    print('${d1} ${d2} ${d3}');
  }

  void caseD1() {
    switch (d1) {
      case 1:
        if (tiger != 0) {
          print('tiger');
          totalMon = totalMon + tiger * 2;
        }
        break;
      case 2:
        if (klos != 0) {
          print('klos');
          totalMon = totalMon + klos * 2;
        }
        break;
      case 3:
        if (chicken != 0) {
          print('checken');
          totalMon = totalMon + chicken * 2;
        }
        break;
      case 4:
        if (fish != 0) {
          print('fish');
          totalMon = totalMon + fish * 2;
        }
        break;
      case 5:
        if (crab != 0) {
          print('grab');
          totalMon = totalMon + crab * 2;
        }
        break;
      case 6:
        if (lobster != 0) {
          print('labstor');
          totalMon = totalMon + lobster * 2;
        }
        break;
    }
  }

  void caseD2() {
    switch (d2) {
      case 1:
        if (tiger != 0) {
          print('tiger');
          totalMon = totalMon + tiger * 2;
        }
        break;
      case 2:
        if (klos != 0) {
          print('klos');
          totalMon = totalMon + klos * 2;
        }
        break;
      case 3:
        if (chicken != 0) {
          print('checken');
          totalMon = totalMon + chicken * 2;
        }
        break;
      case 4:
        if (fish != 0) {
          print('fish');
          totalMon = totalMon + fish * 2;
        }
        break;
      case 5:
        if (crab != 0) {
          print('grab');
          totalMon = totalMon + crab * 2;
        }
        break;
      case 6:
        if (lobster != 0) {
          print('labstor');
          totalMon = totalMon + lobster * 2;
        }
        break;
    }
  }

  void caseD3() {
    switch (d3) {
      case 1:
        if (tiger != 0) {
          print('tiger');
          totalMon = totalMon + tiger * 2;
        }
        break;
      case 2:
        if (klos != 0) {
          print('klos');
          totalMon = totalMon + klos * 2;
        }
        break;
      case 3:
        if (chicken != 0) {
          print('checken');
          totalMon = totalMon + chicken * 2;
        }
        break;
      case 4:
        if (fish != 0) {
          print('fish');
          totalMon = totalMon + fish * 2;
        }
        break;
      case 5:
        if (crab != 0) {
          print('grab');
          totalMon = totalMon + crab * 2;
        }
        break;
      case 6:
        if (lobster != 0) {
          print('labstor');
          totalMon = totalMon + lobster * 2;
        }
        break;
    }
  }

  void caseD1D2() {
    switch (d1) {
      case 1:
        if (tiger != 0) {
          print('tiger');
          totalMon = totalMon + tiger * 3;
        }
        break;
      case 2:
        if (klos != 0) {
          print('klos');
          totalMon = totalMon + klos * 3;
        }
        break;
      case 3:
        if (chicken != 0) {
          print('checken');
          totalMon = totalMon + chicken * 3;
        }
        break;
      case 4:
        if (fish != 0) {
          print('fish');
          totalMon = totalMon + fish * 3;
        }
        break;
      case 5:
        if (crab != 0) {
          print('grab');
          totalMon = totalMon + crab * 3;
        }
        break;
      case 6:
        if (lobster != 0) {
          print('labstor');
          totalMon = totalMon + lobster * 3;
        }
        break;
    }
  }

  void caseD1D3() {
    switch (d1) {
      case 1:
        if (tiger != 0) {
          print('tiger');
          totalMon = totalMon + tiger * 3;
        }
        break;
      case 2:
        if (klos != 0) {
          print('klos');
          totalMon = totalMon + klos * 3;
        }
        break;
      case 3:
        if (chicken != 0) {
          print('checken');
          totalMon = totalMon + chicken * 3;
        }
        break;
      case 4:
        if (fish != 0) {
          print('fish');
          totalMon = totalMon + fish * 3;
        }
        break;
      case 5:
        if (crab != 0) {
          print('grab');
          totalMon = totalMon + crab * 3;
        }
        break;
      case 6:
        if (lobster != 0) {
          print('labstor');
          totalMon = totalMon + lobster * 3;
        }
        break;
    }
  }

  void caseD2D3() {
    switch (d3) {
      case 1:
        if (tiger != 0) {
          print('tiger');
          totalMon = totalMon + tiger * 3;
        }
        break;
      case 2:
        if (klos != 0) {
          print('klos');
          totalMon = totalMon + klos * 3;
        }
        break;
      case 3:
        if (chicken != 0) {
          print('checken');
          totalMon = totalMon + chicken * 3;
        }
        break;
      case 4:
        if (fish != 0) {
          print('fish');
          totalMon = totalMon + fish * 3;
        }
        break;
      case 5:
        if (crab != 0) {
          print('grab');
          totalMon = totalMon + crab * 3;
        }
        break;
      case 6:
        if (lobster != 0) {
          print('labstor');
          totalMon = totalMon + lobster * 3;
        }
        break;
    }
  }

  void caseD1D2D3() {
    switch (d3) {
      case 1:
        if (tiger != 0) {
          print('tiger');
          totalMon = totalMon + tiger * 4;
        }
        break;
      case 2:
        if (klos != 0) {
          print('klos');
          totalMon = totalMon + klos * 4;
        }
        break;
      case 3:
        if (chicken != 0) {
          print('checken');
          totalMon = totalMon + chicken * 4;
        }
        break;
      case 4:
        if (fish != 0) {
          print('fish');
          totalMon = totalMon + fish * 4;
        }
        break;
      case 5:
        if (crab != 0) {
          print('grab');
          totalMon = totalMon + crab * 4;
        }
        break;
      case 6:
        if (lobster != 0) {
          print('labstor');
          totalMon = totalMon + lobster * 4;
        }
        break;
    }
  }

  void caculer() {
    if (d1 != d2 && d1 != d3&& d2!=d3) {
      caseD1();
      caseD2();
      caseD3();
    } else if (d1 == d2 && d1 != d3) {
      caseD1D2();
      caseD3();
    } else if (d1 != d2 && d1 == d3) {
      caseD2();
      caseD1D3();
    } else if (d2 == d3 && d2 != d1) {
      caseD2D3();
      caseD1();
    } else {
      caseD1D2D3();
    }
  }
}
