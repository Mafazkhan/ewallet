import 'package:ewallet/constants/constants.dart';
import 'package:ewallet/providers/widget_provider.dart';
import 'package:ewallet/screens/insight_screen.dart';
import 'package:ewallet/widgets/custom_divider.dart';
import 'package:ewallet/widgets/custom_sizedbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var customWidget = Provider.of<WidgetProvider>(context);
    int _currentIndex = 0;
    Size mq = MediaQuery.sizeOf(context);
    return Scaffold(
        bottomNavigationBar: customWidget.bottomNavBar(_currentIndex, context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox(),
                  Text(
                    "Current Balance",
                    style: kSmallTextStyle,
                  ),
                  SizedBox(
                    height: mq.height * .001,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(text: "\$1432.", style: kCurrencyTextStyle),
                        TextSpan(
                            text: "23",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Rubik",
                            )),
                      ])),
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.show_chart,
                          color: Colors.green,
                          size: 14,
                        ),
                        onPressed: () {
                          customWidget.goTonext(
                              context: context, navigateTo: InsightScreen());
                        },
                        label: Text(
                          "+3.02%",
                          style: TextStyle(color: Colors.green),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shape: StadiumBorder(),
                          minimumSize: Size(
                            mq.width * .080,
                            mq.height * .030,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomSizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customWidget.topIcons(
                        image: 'icons/add.png',
                        isActive: true,
                        label: "Add Money",
                        action: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) {
                              return customWidget.modalSheet(context);
                            },
                          );
                        },
                      ),
                      customWidget.topIcons(
                        image: 'icons/upright.png',
                        isActive: true,
                        label: "Send Money",
                        action: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) {
                              return customWidget.modalSheet(context);
                            },
                          );
                        },
                      ),
                      customWidget.topIcons(
                        image: 'icons/calendar.png',
                        isActive: false,
                        label: "Schedule",
                        action: () {},
                      ),
                      customWidget.topIcons(
                        image: 'icons/chart.png',
                        isActive: false,
                        label: "Insight",
                        action: () {},
                      ),
                    ],
                  ),
                  CustomSizedBox(),
                  customWidget.bannerWidget(context),
                  CustomSizedBox(),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Transactions",
                      style: kHeadingTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * .020,
                  ),
                  customWidget.listTiles(
                    image: 'icons/wise.png',
                    title: "Transfer Wise",
                    date: "26 Oct 2023",
                    amount: "+\$420",
                    isCredit: true,
                  ),
                  CustomDivider(),
                  customWidget.listTiles(
                    image: 'icons/xbox.png',
                    title: "Xbox game-pass",
                    date: "20 Oct 2023",
                    amount: "-\$20",
                    isCredit: false,
                  ),
                  CustomDivider(),
                  customWidget.listTiles(
                    image: 'icons/paypal.png',
                    title: "PayPal",
                    date: "4 Sep 2023",
                    amount: "+\$1000",
                    isCredit: true,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
