
import 'package:flangapp_app/config/app.dart';
import 'package:flangapp_app/helpers/hex_converter.dart';
import 'package:flutter/material.dart';

class Downloader extends StatefulWidget {
  final String filename;
  final int progress;

  const Downloader({Key? key,
    required this.filename,
    required this.progress
  }) : super(key: key);

  @override
  _DownloaderState createState() => _DownloaderState();
}

class _DownloaderState extends State<Downloader> {

  @override
  Widget build(BuildContext context) {
    Color color = HexConverter(Config.color);
    return Positioned(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(widget.filename),
                ),
                LinearProgressIndicator(
                  value: widget.progress / 100,
                  semanticsLabel: 'Linear progress indicator',
                  color: color,
                  backgroundColor: color.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ),
      bottom: 0,
      right: 0,
      left: 0,
    );
  }

}