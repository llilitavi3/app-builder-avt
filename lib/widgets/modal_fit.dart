import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/app.dart';
import '../helpers/hex_converter.dart';
import '../models/navigation_item.dart';

class ModalFit extends StatefulWidget {

  final String title;
  final Function onAction;

  const ModalFit({Key? key,
    required this.title,
    required this.onAction
  }) : super(key: key);

  @override
  _ModalFitState createState() => _ModalFitState();
}

class _ModalFitState extends State<ModalFit> {

  @override
  Widget build(BuildContext context) {
    List<NavigationItem> _items = Config.modalNavigation;
    Color _color = HexConverter(Config.iconColor);
    return Material(
      child: SafeArea(
        top: false,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 0),
          itemCount: _items.isEmpty ? 0 : _items.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return ListTile(
                title: Text(widget.title.toUpperCase(), style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),)
              );
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

}