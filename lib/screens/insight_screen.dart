import 'package:ewallet/constants/app_colors.dart';
import 'package:ewallet/constants/constants.dart';
import 'package:ewallet/providers/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_divider.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.sizeOf(context);

    var customWidget = Provider.of<WidgetProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mq.width * 0.3),
                    child: Text(
                      "Insights",
                      style: kHeadingTextStyle,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: kIconBgColor,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                    leading: customWidget.budgetIndicator(),
                    title: Text(
                      "43.21 left",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Monthly budget • 14 days to go",
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.black,
                    )),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Balance Overview",
                      style: kHeadingTextStyle,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("━  Current month"),
                        SizedBox(width: 40),
                        Text("---  4 months"),
                      ],
                    ),
                    customWidget.graphChart(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customWidget.tileContainer(
                            context: context,
                            title: "Expenses",
                            image: "icons/upright.png",
                            price: "-\$432.",
                            price2: "23"),
                        customWidget.tileContainer(
                            context: context,
                            title: "Money in",
                            image: "icons/downleft.png",
                            price: "-\$1400.",
                            price2: "00"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
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
            ],
          ),
        ),
      ),
    );
  }
}
