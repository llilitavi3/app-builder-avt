import 'dart:io' show Platform;

import 'package:flangapp_app/views/web_view.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../config/app.dart';
import '../helpers/hex_converter.dart';
import '../widgets/loader.dart';

class SplashView extends StatefulWidget {

  const SplashView({Key? key,

  }) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    String? playerID;
    if (Config.osAndroidEnabled) {
      OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
      OneSignal.shared.setAppId(Config.osAppID);
      OSDeviceState? state = await OneSignal.shared.getDeviceState();
      playerID = state?.userId;
    }
    Future.delayed(Duration(seconds: Config.splashDelay), () {
      Navigator.of(context).pushReplacement(MaterialWithModalsPageRoute(
          builder: (BuildContext context) => WebView(
            playerID: playerID,
          ))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexConverter(Config.splashBackgroundColor),
        body: Container(
          decoration: Config.splashIsBackgroundImage ?
          BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/app/${Config.splashBackgroundImage}"),
                fit: BoxFit.cover,
              )
          ) : null,
          child: Center(
            child: Config.splashIsDisplayLogo ? Image.asset(
                "assets/app/${Config.splashLogoImage}",
                width: 110
            ) : null,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const ProgressState()
    );
  }
}

class ProgressState extends StatelessWidget {

  const ProgressState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Platform.isAndroid ? Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Loader(
            color: Config.splashTextColor,
            width: 50,
            isSpinner: true,
            isDisplay: true,
          ),
          if (Config.splashTagline.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(Config.splashTagline, style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: HexConverter(Config.splashTextColor),
              ), overflow: TextOverflow.ellipsis, maxLines: 1),
            )
        ],
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Loader(
            color: Config.splashTextColor,
            width: 100,
            isSpinner: true,
            isDisplay: true,
          ),
          if (Config.splashTagline.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Text(Config.splashTagline, style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: HexConverter(Config.splashTextColor),
              ), overflow: TextOverflow.ellipsis, maxLines: 1),
            )
        ],
      ),
    );
  }
}