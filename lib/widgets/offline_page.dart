import 'package:flangapp_app/helpers/hex_converter.dart';
import 'package:flutter/material.dart';

import '../config/app.dart';

class OfflinePage extends StatefulWidget {

  const OfflinePage({Key? key,

  }) : super(key: key);

  @override
  _OfflinePageState createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {

  final Color color = HexConverter(Config.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                  "assets/app/${Config.offlineImage}",
                  width: 250
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text(Config.messageErrorOffline, style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ), textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }

}