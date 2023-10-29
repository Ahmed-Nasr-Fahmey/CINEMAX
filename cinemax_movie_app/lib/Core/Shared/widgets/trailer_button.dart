import 'package:flutter/material.dart';

class TrailerButton extends StatelessWidget {
  const TrailerButton(
      {super.key,
      required this.icon,
      required this.backgroundColor,
      required this.iconColor, required this.onTap});
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360), color: backgroundColor),
          ),
          Positioned(
            left: 11,
            top: 11,
            child: Icon(
              icon,
              color: iconColor,
            ),
          )
        ],
      ),
    );
  }
}
