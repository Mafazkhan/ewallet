import 'package:ewallet/constants/app_colors.dart';
import 'package:ewallet/providers/widget_provider.dart';
import 'package:ewallet/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WidgetProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-wallet',
        theme: ThemeData(
          scaffoldBackgroundColor: kAppBackgroundColor,
          fontFamily: 'Rubik',
        ),
        home: HomeScreen(),
      ),
    );
  }
}
