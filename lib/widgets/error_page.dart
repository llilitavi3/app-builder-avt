import 'package:flangapp_app/helpers/hex_converter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/app.dart';

class ErrorPage extends StatefulWidget {
  final VoidCallback onBack;

  const ErrorPage({Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {

  final Color color = HexConverter(Config.color);

  void _openEmail() async {
    String email = "mailto://${Config.appEmail}";
    if (await canLaunch(email)) {
      await launch(email);
    }
  }

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
                  "assets/app/${Config.errorBrowserImage}",
                  width: 250
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text(Config.messageErrorBrowser, style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ), textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: OutlinedButton(
                child: Text(Config.backBtn, style: TextStyle(color: color)),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                    HexConverter(Config.color).withOpacity(0.15),
                  ),
                ),
                onPressed: widget.onBack,
              ),
            ),
            TextButton(
                child: Text(Config.contactBtn, style: TextStyle(color: color)),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                    HexConverter(Config.color).withOpacity(0.15),
                  ),
                ),
                onPressed: () => _openEmail()
            )
          ],
        ),
      ),
    );
  }

}