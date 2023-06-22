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
}
