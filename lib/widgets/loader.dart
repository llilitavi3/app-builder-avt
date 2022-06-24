import 'dart:io' show Platform;

import 'package:flangapp_app/helpers/hex_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Loader extends StatefulWidget {
  final String color;
  final bool isSpinner;
  final double width;
  final bool isDisplay;

  const Loader({Key? key,
    required this.color,
    required this.isSpinner,
    required this.width,
    required this.isDisplay
  }) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {

  @override
  Widget build(BuildContext context) {
    Color color = HexConverter(widget.color);
    return !widget.isDisplay
        ? const SizedBox(width: 0, height: 0)
        : widget.isSpinner
          ? Platform.isAndroid
            ? _androidCircularLoader(color)
            : _iOsCircularLoader(color)
          : _lineLoader(color);
  }

  Widget _lineLoader(Color color) {
    return Positioned(
      child: LinearProgressIndicator(
        minHeight: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        backgroundColor: Colors.grey.withOpacity(0.9),
      ),
      top: 0,
      width: widget.width,
    );
  }

  Widget _androidCircularLoader(Color color) {
    return Positioned(
      child: Center(
        child: SizedBox(
          height: 30.0,
          width: 30.0,
          child: CircularProgressIndicator(
            strokeWidth: 3.00,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ),
      top: 0,
      bottom: 0,
      right: 0,
      left: 0,
    );
  }

  Widget _iOsCircularLoader(Color color) {
    return Container(
      alignment: Alignment.center,
      height: 15,
      child: CupertinoActivityIndicator(
        color: color,
        radius: 15,
      ),
    );
  }

}