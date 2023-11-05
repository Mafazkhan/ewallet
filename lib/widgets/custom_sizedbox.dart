import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.sizeOf(context);

    return SizedBox(
      height: mq.height * .020,
    );
  }
}
