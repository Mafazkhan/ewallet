import 'package:ewallet/constants/app_colors.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final String image;
  final VoidCallback action;
  final bool? isActive;

  IconWidget(
      {required this.image, required this.action, required this.isActive});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: EdgeInsets.all(5),
        height: 50,
        child: Image.asset(
          image,
          color: Colors.black,
        ),
        decoration: BoxDecoration(
          color: isActive! ? kSelectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isActive! ? Colors.black : Colors.grey,
            width: 2,
          ),
        ),
      ),
    );
  }
}
