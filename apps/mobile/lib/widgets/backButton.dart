import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class backButton extends StatelessWidget {
  final Function() onPressed;
  final Color iconColor;
  final Color circleColor;

  const backButton({super.key, required this.onPressed, required this.iconColor, required this.circleColor});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: circleColor,
          width: 2,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          CupertinoIcons.xmark,
          color: iconColor,
          size: 28,
        ),
      ),
    );
  }
}