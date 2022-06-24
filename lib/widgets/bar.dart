import 'dart:io' show Platform;

import 'package:flangapp_app/helpers/hex_converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app.dart';
import '../enum/template.dart';
import '../models/navigation_item.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {

  final String title;
  final Future<bool> canBack;
  final VoidCallback onBack;
  final VoidCallback onDrawer;
  final Function onAction;

  const Bar({Key? key,
    required this.title,
    required this.canBack,
    required this.onBack,
    required this.onDrawer,
    required this.onAction
  }) : super(key: key);

  @override
  _BarState createState() => _BarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BarState extends State<Bar> {

  final String _iconBackChevron = "assets/system/chevron-back-outline.svg";
  final String _iconBackArrow = "assets/system/arrow-back-outline.svg";
  final String _iconMenu = "assets/system/menu-outline.svg";
  final Color background = HexConverter(Config.color);
  final Color textColor = Config.isDark ? Colors.white : Colors.black;
  final List<NavigationItem> barNavigationItems = Config.barNavigation;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: widget.canBack,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return Platform.isAndroid ? _androidBar(snapshot) : _iOSBar(snapshot);
      },
    );
  }

  Widget _iOSBar(AsyncSnapshot<bool> snapshot) {
    return CupertinoNavigationBar(
      backgroundColor: background,
      middle: Text(widget.title, style: TextStyle(
        color: textColor,
      ), overflow: TextOverflow.ellipsis, maxLines: 1),
      brightness: Config.isDark ? Brightness.dark : Brightness.light,
      leading: snapshot.hasData ? _iOSLeading(snapshot.data) : null,
      trailing: _iOSTrailing(),
    );
  }

  Widget? _iOSLeading(bool? canBack) {
    if (canBack == true) {
      return CupertinoButton(
        padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 18),
        minSize: 0,
        child: SvgPicture.asset(
          _iconBackChevron,
          color: Config.isDark ? Colors.white : Colors.black,
          width: 23,
        ),
        onPressed: () => widget.onBack(),
      );
    }
    if (canBack == false && Config.appTemplate == Template.drawer) {
      return CupertinoButton(
        padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 18),
        minSize: 0,
        child: SvgPicture.asset(
          _iconMenu,
          color: Config.isDark ? Colors.white : Colors.black,
          width: 23,
        ),
        onPressed: () => widget.onDrawer(),
      );
    }
    return null;
  }

  Widget _iOSTrailing() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for(final item in barNavigationItems)
          CupertinoButton(
            child: SvgPicture.asset(
              "assets/app/${item.icon}",
              color: Config.isDark ? Colors.white : Colors.black,
              width: 23,
            ),
            onPressed: () => widget.onAction(item),
            padding: const EdgeInsets.only(left: 14),
            minSize: 0,
          )
      ],
    );
  }

  Widget _androidBar(AsyncSnapshot<bool> snapshot) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: background,
      title: Text(widget.title, style: TextStyle(
        color: textColor,
      )),
      leading: snapshot.hasData ? _androidLeading(snapshot.data) : null,
      actions: [
        for(final item in barNavigationItems)
          IconButton(
            icon: SvgPicture.asset(
              "assets/app/${item.icon}",
              color: textColor,
              semanticsLabel: item.name,
              width: 25,
            ),
            color: textColor,
            onPressed: () => widget.onAction(item),
          )
      ],
    );
  }

  Widget? _androidLeading(bool? canBack) {
    String _icon = "";
    bool _display = false;
    if (canBack != null) {
      if (canBack == true) {
        _icon = _iconBackArrow;
        _display = true;
      } else {
        if (Config.appTemplate == Template.drawer) {
          _icon = _iconMenu;
          _display = true;
        } else {
          _display = false;
        }
      }
      return _display ? IconButton(
        icon: SvgPicture.asset(
          _icon,
          color: textColor,
          width: 25,
        ),
        color: textColor,
        onPressed: () {
          if (canBack == true) {
            widget.onBack();
          } else {
            widget.onDrawer();
          }
        },
      ) : null;
    } else {
      return null;
    }
  }

}