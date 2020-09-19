import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleIcon extends StatelessWidget {
  final Color iconColor;
  final Color fillColor;
  final IconData icon;
  final double size;

  const CircleIcon({
    Key key,
    @required this.icon,
    this.fillColor = Colors.black,
    this.iconColor = Colors.white,
    this.size = 34,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: size,
        height: size,
        color: fillColor,
        child: Center(
          child: FaIcon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
