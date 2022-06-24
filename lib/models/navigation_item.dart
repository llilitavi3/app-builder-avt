import 'package:flangapp_app/enum/action_type.dart';

class NavigationItem {
  final String name;
  final String icon;
  final ActionType type;
  final String value;

  NavigationItem({
    required this.name,
    required this.icon,
    required this.type,
    required this.value
  });

}