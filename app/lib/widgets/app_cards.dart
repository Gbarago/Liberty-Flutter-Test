import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AppCards {
  overviewCards(BuildContext context,
      {String? imgUrl,
      String? figure,
      String? title,
      Color? cardColor,
      Color? avatarColor}) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
          left: w * 0.055, right: w * 0.055, top: h * 0.023, bottom: h * 0.025),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: h * 0.05,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: avatarColor),
                child: Image(
                    image: AssetImage(
                  imgUrl ?? '',
                )),
              ),
              FittedBox(
                  child: Text(
                figure ?? '',
                style: const TextStyle(fontSize: 24),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                  child: Text(
                title ?? '',
                style: const TextStyle(fontSize: 14),
              )),
            ],
          )
        ],
      ),
    );
  }

  taskinProgressCard(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: h * 0.02),
      color: Colors.white,
      height: h * 0.22,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
                'Liberty Pay Loan App',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff373737)),
              ),
              const Text(
                'Team members',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff4E4E4E)),
              ),
              Row(
                children: const [CircleAvatar()],
              )
            ],
          ),
          Column(
            children: [
              Container(
                width: w * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xff58028C),
                ),
                child: const Text('4d'),
              ),
              CircularPercentIndicator(
                radius: w * 0.07,
                lineWidth: 2.0,
                percent: .44,
                center: const Text("44%"),
                progressColor: const Color(0xff59B200),
              )
            ],
          )
        ],
      ),
    );
  }
}
