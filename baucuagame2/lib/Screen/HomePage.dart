import 'package:baucuagame2/AppsFlyer.dart';
import 'package:baucuagame2/Screen/GamePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'dart:ui' as ui;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // AppflyerClass appflyer = AppflyerClass();
  // String uri =
  //     'https://www.youtube.com/watch?v=CcSp0p_2rjQ&list=RDnGlzlJuA0OI&index=2';
  // String langCode = '';
  // String message = '';
  // String Type = '';
  // WebViewController webViewController = WebViewController();
  // String eventName = '';
  // String event = '';
  // String none1 = '';
  // String keyName = '';
  // String key = '';
  // String none2 = '';
  // String valueName = '';
  // String value = '';
  // String currency = '';
  // String amount = '';
  // int step = 1;

  // bool typeData = false;
  // void resetValue() {
  //   eventName = '';
  //   event = '';
  //   none1 = '';
  //   keyName = '';
  //   key = '';
  //   none2 = '';
  //   valueName = '';
  //   value = '';
  //   step = 1;
  //   // for currency
  //   currency = '';
  //   amount = '';
  // }

  // void genericEvent(test) {
  //   for (int i = 0; i < test.length; i++) {
  //     switch (step) {
  //       case 1:
  //         {
  //           eventName = eventName + test[i];
  //           if (eventName == 'event_name=') {
  //             step = 2;
  //           }
  //         }
  //         break;
  //       case 2:
  //         {
  //           event = event + test[i];
  //           if (test[i + 1] == '#') {
  //             step = 3;
  //           }
  //         }
  //         break;
  //       case 3:
  //         {
  //           none1 = none1 + test[i];
  //           if (none1 == '###') {
  //             step = 4;
  //           }
  //         }
  //         break;
  //       case 4:
  //         {
  //           keyName = keyName + test[i];
  //           if (keyName == 'key=') {
  //             print('case 4= true');
  //             step = 5;
  //           }
  //         }
  //         break;
  //       case 5:
  //         {
  //           key = key + test[i];
  //           if (test[i + 1] == '#') {
  //             print('case 5 true');
  //             step = 6;
  //           }
  //         }
  //         break;
  //       case 6:
  //         {
  //           none2 = none2 + test[i];
  //           if (none2 == '###') {
  //             print('case 6 true');
  //             step = 7;
  //           }
  //         }
  //         break;
  //       case 7:
  //         {
  //           valueName = valueName + test[i];
  //           if (valueName == 'value=') {
  //             print('case 7 true');
  //             step = 8;
  //           }
  //         }
  //         break;
  //       case 8:
  //         {
  //           value = value + test[i];
  //           if (i == test.length) {
  //             break;
  //           }
  //         }
  //         break;
  //     }
  //   }
  //   print('event name = $event');
  //   print('key = $key');
  //   print('value = $value');
  // }

  // Future<void> _http() async {
  //   await http.get(Uri.parse(uri));
  //   setState(() {});
  // }

  @override
  void initState() {
    // _http();
    // appflyer.appConf();
    // appflyer.initApp();

    // requestLan();
    // print(langCode + 'Langggiiiii');
    super.initState();
    // checkMessage();
    shake = true;
    // webViewController
    // ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // ..addJavaScriptChannel(
    //   'Toast',
    //   onMessageReceived: (JavaScriptMessage ms) {
    //     message = ms
    //         .message; // event_name=sdffdsfdgf34###value=232cdfdf###key=34345dffgb
    //     print("ms: $message");
    //     if (message == null) return;
    //     if (message == "") return;
    //     checkMessage();
    //     if (typeData) {
    //       print('cash true');
    //       final Map eventValues = {
    //         "af_content_id": "purchase",
    //         "af_currency": "$currency",
    //         "af_revenue": "$amount"
    //       };
    //       appflyer.logEvent('purchase', eventValues);
    //     }
    //     if (!typeData) {
    //       print('other true');
    //       final Map eventValues = {
    //         "content_id": "$event",
    //         "content_key": "$key",
    //         "content_value": "$value"
    //       };
    //       appflyer.logEvent(event, eventValues);
    //     }
    //     resetValue();
    //   },
    // )
    // ..loadRequest(Uri.parse(uri));
  }

  // void requestLan() {
  //   langCode = ui.window.locale.languageCode;
  //   print('$langCode langiiiiiii');
  // }
  // void checkMessage() {
  //   bool containsChar = message.contains("###");
  //   bool genericdata = message.contains("event_name") &&
  //       message.contains("key") &&
  //       message.contains("value");
  //   if (containsChar) {
  //     if (containsChar && genericdata) {
  //       Type = 'This is Generic Event';
  //       genericEvent(message);
  //       typeData = false;
  //     } else {
  //       typeData = true;
  //       Type = 'This is Amount and Currency Data';
  //       for (int i = message.length - 1; i >= 0; i--) {
  //         if (message[i] != '#') {
  //           currency = message[i] + currency;
  //         }
  //         if (message[i] == '#') {
  //           break;
  //         }
  //       }
  //       print(currency);
  //       for (int i = 0; i < message.length - 1; i++) {
  //         if (message[i] != '#') {
  //           amount = amount + message[i];
  //         }
  //         if (message[i] == '#') {
  //           break;
  //         }
  //       }
  //       print(amount);
  //     }
  //   }
  // }

  bool shake = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Image.asset(
                'assets/image/Interface BẦU CUA_.png',
                height: height,
                width: width,
                fit: BoxFit.fill,
              ),
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
                          builder: (context) => const GamePage()));
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
