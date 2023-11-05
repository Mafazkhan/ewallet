import 'package:flutter/material.dart';

class TileIcon extends StatelessWidget {
  final String image;

  TileIcon({required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 60,
      child: Image.asset(
        image,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Color(0xffe5e5e5),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
