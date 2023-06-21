
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
class AppflyerClass {

  late AppsflyerSdk _appsflyer;

  void initApp(){
    _appsflyer.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: false,
        registerOnDeepLinkingCallback: true);
  }
  void appConf() {
    print('call appflyer');
    final AppsFlyerOptions options = AppsFlyerOptions(
        afDevKey: "ULi7YEVxi9RyBTiYomf8CA",
        appId: "APP_ID",
        showDebug: true,
        timeToWaitForATTUserAuthorization: 15);
    _appsflyer = AppsflyerSdk(options);
    _appsflyer.onAppOpenAttribution((res) {
      print("onAppOpenAttribution res: " + res.toString());
    });
    _appsflyer.onInstallConversionData((res) {
      print("onInstallConversionData res: " + res.toString());


    });
  }

  Future<bool?> logEvent(String event, Map Values) {

    return _appsflyer.logEvent(event, Values);
  }
}