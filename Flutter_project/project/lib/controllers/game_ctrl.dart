import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class GameController extends ChangeNotifier {
  AudioPlayer shakeClicker = AudioPlayer();
  AudioPlayer victory = AudioPlayer();
  AudioPlayer clickCoin = AudioPlayer();
  AudioPlayer clickCoins = AudioPlayer();
  AudioPlayer timeClick = AudioPlayer();
  AudioPlayer open = AudioPlayer();

  bool sound = false;
  bool show = false;

  void clickCoinCtrl(bool value) {
    if (sound == value) {
      clickCoins.play(AssetSource('coinsplash.mp3'));
    } else {
      clickCoin.stop();
    }
    notifyListeners();
  }

  void clickCoinssCtrl(bool value) {
    if (sound == value) {
      clickCoins.play(AssetSource('coinsplash.mp3'));
    } else {
      clickCoins.stop();
    }
    notifyListeners();
  }

  void timeClickCtrl(bool value) {
    if (sound == value) {
      timeClick.play(AssetSource('changBet.mp3'));
    } else {
      timeClick.stop();
    }
    notifyListeners();
  }

  void openCtrl(bool value) {
    if (sound == true) {
      open.play(AssetSource('opencover.mp3'));
    } else {
      open.stop();
    }
    notifyListeners();
  }

  void shakeClickCtrl(bool value) {
    if (sound == value) {
      shakeClicker.play(AssetSource('shake.mp3'));
    } else {
      shakeClicker.stop();
    }
    notifyListeners();
  }

  void victoryCtrl(bool value) {
    if (sound == true) {
      victory.play(AssetSource('victory.mp3'));
    } else {
      victory.stop();
    }
    notifyListeners();
  }

  void suffleDice(int d1, int d2, int d3) {
    var random = Random();
    var i1 = random.nextInt(6) + 1;
    d1 = i1;
    var i2 = random.nextInt(6) + 1;
    d2 = i2;
    var i3 = random.nextInt(6) + 1;
    d3 = i3;
    notifyListeners();
  }

  void setTimerAction(bool show, bool click, bool shake, int count, double d,
      double h, int d1, int d2, int d3, double time, double turn) {
    timeClickCtrl(show);
    if (show == true) {
      count--;
      if (count == 3) {
        d = 95;
        h = 300;
        victoryCtrl(show);
      } else if (count == 4) {
      } else if (count == 0) {
        caculer(d1, d2, d3);
        suffleDice(d1, d2, d3);
        openCtrl(show);
      }
    } else {
      time--;
      if (time == 0) {
        turn--;
        if (time == 0) {
          turn = 0;
          count = 4;

          show = true;
          openCtrl(show);
        } else {
          if (time <= 2) {
            click = false;
          } else if (time <= 8) {
            shake = false;
          } else {
            click = true;
            shakeClickCtrl(show);
            shake = true;
          }
        }
      }
    }
  }

  void removeItemList(
      double tiger,
      int klos,
      int chicken,
      int fish,
      int crab,
      int loster,
      int turnCoins,
      int turnKlos,
      int turnChecken,
      int turnFish,
      int turnCrab,
      int turnLobster) {
    tiger = 0;
    klos = 0;
    chicken = 0;
    fish = 0;
    crab = 0;
    turnCoins = 0;
    turnKlos = 0;
    turnChecken = 0;
    turnFish = 0;
    turnCrab = 0;
    turnLobster = 0;
    notifyListeners();
  }

  void caculer(int d1, int d2, int d3) {
    if (d1 != d2 && d1 != d3 && d2 != d3) {}
  }
}
