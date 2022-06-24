import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/app.dart';
import '../enum/action_type.dart';
import '../helpers/hex_converter.dart';
import '../models/navigation_item.dart';

class AppTabs extends StatefulWidget {

  final Function onTabChange;
  final int currentIndex;

  const AppTabs({Key? key,
    required this.onTabChange,
    required this.currentIndex
  }) : super(key: key);

  @override
  _AppTabsState createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> {

  final Color primaryColor = HexConverter(Config.activeColor);
  final List<NavigationItem> _items = Config.mainNavigation;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? _androidTabBar() : _iosTabBar();
  }

  Widget _androidTabBar() {
    return BottomNavigationBar(
      items: [
        for (var i = 0; i < _items.length; i ++)
          if (_items[i].type == ActionType.internal)
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/app/${_items[i].icon}",
                color: i != widget.currentIndex
                    ? Colors.grey.shade600
                    : primaryColor,
                semanticsLabel: _items[i].name,
                width: 26,
              ),
              label: _items[i].name,
            ),
      ],
      currentIndex: widget.currentIndex,
      selectedItemColor: primaryColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedFontSize: 11,
      selectedFontSize: 11,
      unselectedLabelStyle: TextStyle(
          color: Colors.grey.shade600
      ),
      onTap: _onItemTapped,
    );
  }

  Widget _iosTabBar() {
    return CupertinoTabBar(
      items: [
        for (var i = 0; i < _items.length; i ++)
          if (_items[i].type == ActionType.internal)
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/app/${_items[i].icon}",
                color: i != widget.currentIndex
                    ? Colors.grey.shade600
                    : primaryColor,
                semanticsLabel: _items[i].name,
                width: 26,
              ),
              label: _items[i].name,
            ),
      ],
      currentIndex: widget.currentIndex,
      iconSize: 26,
      activeColor: primaryColor,
      inactiveColor: Colors.grey.shade600,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    widget.onTabChange(index);
  }

}