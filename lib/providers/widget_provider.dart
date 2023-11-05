import 'package:ewallet/constants/app_colors.dart';
import 'package:ewallet/constants/constants.dart';
import 'package:ewallet/screens/insight_screen.dart';
import 'package:ewallet/widgets/custom_divider.dart';
import 'package:ewallet/widgets/custom_sizedbox.dart';
import 'package:ewallet/widgets/icon_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WidgetProvider extends ChangeNotifier {
  // Row icons
  Widget topIcons({
    required VoidCallback action,
    required String image,
    required bool isActive,
    required String label,
  }) {
    return GestureDetector(
      onTap: action,
      child: Column(
        children: [
          IconWidget(
            image: image,
            action: action,
            isActive: isActive,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: kSubtitleTextStyle,
          ),
        ],
      ),
    );
  }

  // Banner widget
  Widget bannerWidget(BuildContext context) {
    Size mq = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      height: mq.height * .3,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kAccentColor,
      ),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12, left: 12),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Send someone",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      "Quickly pay your most recent contacts again",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    ElevatedButton(
                      child: Text(
                        "Add money",
                        style: TextStyle(
                          color: Color(0xff4d55da),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(),
                        minimumSize: Size(
                          mq.width * .080,
                          mq.height * .050,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              'icons/wallet.png',
              height: mq.height * .3,
            ),
          ),
        ],
      ),
    );
  }

  // List tiles

  Widget listTiles({
    required String image,
    required String title,
    required String date,
    required String amount,
    required bool isCredit,
  }) {
    return ListTile(
        leading: Container(
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
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          date,
          style: kSmallTextStyle,
        ),
        trailing: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: amount,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isCredit ? Colors.green : Colors.red,
                    fontSize: 20)),
            TextSpan(
                text: ".00",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isCredit ? Colors.green : Colors.red,
                    fontSize: 15))
          ]),
        ));
  }

  Widget bottomNavBar(int _currentIndex, BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black54,
      selectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kAppBackgroundColor,
      elevation: 0,
      currentIndex: _currentIndex,
      onTap: (int newIndex) {
        goTonext(context: context, navigateTo: InsightScreen());
      },
      items: [
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: kSelectedColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'icons/home.png',
              height: 20,
            ),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'icons/card.png',
              height: 20,
            ),
          ),
          label: "Near me",
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'icons/chart.png',
              height: 20,
            ),
          ),
          label: "Insight",
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'icons/profile.png',
              height: 20,
            ),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  // Custom number pad

  Widget numberPad(String number) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Container(
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: kIconBgColor, elevation: 0),
            onPressed: () {},
            child: Text(
              number,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  // Modal Bottom Sheet
  Widget modalSheet(BuildContext context) {
    Size mq = MediaQuery.sizeOf(context);

    return Material(
      child: Container(
        color: Color(0xffbebebe),
        child: Container(
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
          decoration: BoxDecoration(
            color: kAppBackgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.horizontal_rule_sharp,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                      SizedBox(width: mq.width * .31),
                      Text(
                        "Transfer",
                        style: kHeadingTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mq.width * .4, vertical: 10),
                    child: Container(
                      height: 40,
                      child: IconWidget(
                          image: "icons/upright.png",
                          action: () {},
                          isActive: false),
                    ),
                  ),
                  Text(
                    "Send to:",
                    style: kSmallTextStyle,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Ruben Vaccaro",
                    style: TextStyle(
                        fontSize: 13,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12, top: 15),
                        child: Text(
                          "USD",
                          style: kSmallTextStyle,
                        ),
                      ),
                      SizedBox(width: mq.width * .25),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(text: "\$500,", style: kCurrencyTextStyle),
                        TextSpan(
                            text: "00",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Rubik",
                            )),
                      ])),
                    ],
                  ),
                  CustomDivider(),
                  Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Available in balance: \$1200.",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: "00",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Rubik",
                          )),
                    ])),
                  ),
                  CustomSizedBox(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        numberPad("1"),
                        numberPad("2"),
                        numberPad("3"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        numberPad("4"),
                        numberPad("5"),
                        numberPad("6"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        numberPad("7"),
                        numberPad("8"),
                        numberPad("9"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        numberPad("."),
                        numberPad("0"),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            child: Container(
                              height: 40,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kIconBgColor,
                                      elevation: 0),
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.backspace_outlined,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Continue"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kAccentColor,
                        shape: StadiumBorder(),
                        minimumSize: Size(mq.width * .8, mq.height * .07)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Graph chart created here
  Widget graphChart() {
    return Container(
      height: 150,
      width: double.infinity,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: bottomTitles,
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            show: true,
          ),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                strokeWidth: 0,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                strokeWidth: 0,
              );
            },
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 2),
                FlSpot(2, 2),
                FlSpot(2, 3),
                FlSpot(4, 3),
                FlSpot(4, 1),
                FlSpot(7, 1),
                FlSpot(7, 4),
                FlSpot(11, 4),
              ],
              color: kAccentColor,
              barWidth: 1,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Color(0xffe6e6f0),
              ),
            ),
            LineChartBarData(
              spots: [
                FlSpot(0, 1),
                FlSpot(2, 1),
                FlSpot(2, 2),
                FlSpot(5, 2),
                FlSpot(5, 0),
                FlSpot(11, 0),
              ],
              dashArray: [5, 5],
              color: Colors.black12,
              barWidth: 1,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Sept 3', style: kSmallTextStyle);
        break;
      case 4:
        text = const Text('Oct 3', style: kSmallTextStyle);
        break;
      case 7:
        text = const Text('Nov 3', style: kSmallTextStyle);
        break;
      case 10:
        text = const Text('Dec 3', style: kSmallTextStyle);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: text,
    );
  }
  // budget progress indicator

  Widget budgetIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          // you can replace this with Image.asset
          'icons/chart.png',
          fit: BoxFit.cover,
          height: 20,
          width: 20,
        ),
        // you can replace
        SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(
            backgroundColor: Colors.black12,
            strokeCap: StrokeCap.round,
            color: kAccentColor,
            strokeWidth: 4,
            value: 0.65,
          ),
        ),
      ],
    );
  }

  // Tile container
  Widget tileContainer({
    required BuildContext context,
    required String title,
    required String image,
    required String price,
    required String price2,
  }) {
    Size mq = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: mq.height * .14,
      width: mq.width * .45,
      decoration: BoxDecoration(
        color: kIconBgColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                height: 30,
                width: 30,
                child: IconWidget(image: image, action: () {}, isActive: false),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 6, top: 6),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(text: price, style: kCurrencyTextStyle),
              TextSpan(
                  text: price2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Rubik",
                  )),
            ])),
          ),
        ],
      ),
    );
  }

  // Routing
  goTonext({required BuildContext context, required Widget navigateTo}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => navigateTo,
      ),
    );
  }
}
