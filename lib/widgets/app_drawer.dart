import 'package:flangapp_app/helpers/hex_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/app.dart';
import '../enum/background_mode.dart';
import '../models/navigation_item.dart';

class AppDrawer extends StatefulWidget {

  final String activeLink;
  final Function onAction;

  const AppDrawer({Key? key,
    required this.activeLink,
    required this.onAction
  }) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  @override
  Widget build(BuildContext context) {
    Color _color = HexConverter(Config.iconColor);
    List<NavigationItem> _items = Config.mainNavigation;
    return Drawer(
      child: SafeArea(
        top: Config.drawerBackgroundMode == BackgroundMode.none
            ? true : false,
        bottom: Config.drawerBackgroundMode == BackgroundMode.none
            ? true : false,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemCount: _items.isEmpty ? 0 : _items.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              if (Config.drawerBackgroundMode != BackgroundMode.none) {
                return _header();
              } else {
                return Container();
              }
            }
            index -= 1;
            return ListTile(
              leading: SvgPicture.asset(
                "assets/app/${_items[index].icon}",
                color: _color,
                width: 25,
              ),
              title: Text(_items[index].name, style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black
              )),
              selected: _items[index].value == widget.activeLink
                  ? true
                  : false,
              selectedTileColor: _color.withOpacity(0.2),
              onTap: () {
                Navigator.of(context).pop();
                widget.onAction(_items[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Config.drawerBackgroundMode == BackgroundMode.color
                ? HexConverter(Config.drawerBackgroundColor)
                : null,
            image: Config.drawerBackgroundMode == BackgroundMode.image
                ? DecorationImage(
                image: AssetImage("assets/app/${Config.drawerBackgroundImage}"),
                fit: BoxFit.cover)
                : null
        ),
        child: Config.drawerBackgroundMode != BackgroundMode.none ? SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: _logoHead(),
          ),
        ) : null,
      ),
    );
  }

  Widget _logoHead() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Config.drawerIsDisplayLogo)
          Image.asset("assets/app/${Config.drawerLogoImage}", height: 90),
        if (Config.drawerTitle.isNotEmpty)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Config.drawerTitle, style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Config.drawerIsDark ? Colors.white : Colors.black
              ), overflow: TextOverflow.ellipsis, maxLines: 1),
              if (Config.drawerSubtitle.isNotEmpty)
                Text(Config.drawerSubtitle, style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Config.drawerIsDark
                        ? Colors.white.withOpacity(0.6)
                        : Colors.black.withOpacity(0.6)
                ), overflow: TextOverflow.ellipsis, maxLines: 1),
            ],
          )
      ],
    );
  }

}