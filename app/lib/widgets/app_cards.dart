import 'package:app/screens/dashboard/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:get/get.dart';
import 'buttons.dart';

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
      padding: EdgeInsets.symmetric(horizontal: h * 0.023, vertical: h * 0.026),
      color: Colors.white,
      height: h * 0.22,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Liberty Pay Loan App',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff373737)),
              ),
              SizedBox(height: h * 0.0095),
              const Text(
                'Team members',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff4E4E4E)),
              ),
              SizedBox(height: h * 0.0085),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xffFFE3DE),
                    radius: w * 0.028,
                    child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/teammemberavatar3.png',
                        )),
                  ),
                  SizedBox(width: w * 0.008),
                  CircleAvatar(
                    backgroundColor: const Color(0xffFFE3DE),
                    radius: w * 0.028,
                    child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/teammemberavatar2.png',
                        )),
                  ),
                  SizedBox(width: w * 0.008),
                  CircleAvatar(
                    backgroundColor: const Color(0xffFFE3DE),
                    radius: w * 0.028,
                    child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/teammemberavatar1.png',
                        )),
                  ),
                ],
              ),
              SizedBox(height: h * 0.045),
              dateCard(context),
            ],
          ),
          Column(
            children: [
              Container(
                width: w * 0.09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xff58028C),
                ),
                child: const Center(
                  child: Text(
                    '4d',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: h * 0.06),
              CircularPercentIndicator(
                radius: w * 0.07,
                lineWidth: 2.0,
                percent: .44,
                center: const Text(
                  "44%",
                  style: TextStyle(
                    color: Color(0xff59B200),
                  ),
                ),
                progressColor: const Color(0xff59B200),
                backgroundColor: const Color(0xffD6FFAE),
              )
            ],
          )
        ],
      ),
    );
  }
}

dateCard(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;

  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: w * 0.14),
            const Text(
              'Start',
              style: TextStyle(fontSize: 5, color: Color(0xffF30909)),
            ),
            SizedBox(width: w * 0.13),
            const Text(
              'End',
              style: TextStyle(fontSize: 5, color: Color(0xff009A49)),
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffFFE3DE),
              radius: w * 0.024,
              child: const Image(
                  fit: BoxFit.scaleDown,
                  image: AssetImage(
                    'assets/images/dateicon.png',
                  )),
            ),
            SizedBox(width: w * 0.02),
            const Text('27-3-2022',
                style: TextStyle(fontSize: 10, color: Color(0xff4E4E4E))),
            SizedBox(width: w * 0.03),
            const Text('27-3-2022',
                style: TextStyle(fontSize: 10, color: Color(0xff4E4E4E))),
          ],
        )
      ],
    ),
  );
}

projectListCard(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;

  return Container(
    margin: EdgeInsets.only(bottom: h * 0.024),
    padding: EdgeInsets.symmetric(horizontal: h * 0.023, vertical: h * 0.026),
    color: Colors.white,
    height: h * 0.18,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffFFE3DE),
                  radius: w * 0.034,
                  child: const Image(
                      fit: BoxFit.scaleDown,
                      image: AssetImage(
                        'assets/images/libertylogo.png',
                      )),
                ),
                const Text(
                  'Liberty Pay ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff373737)),
                ),
              ],
            ),
            SizedBox(height: h * 0.045),
            addTaskDateCard(context),
          ],
        ),
        Column(
          children: [
            Container(
              height: h * 0.025,
              width: w * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: const Color(0xff009A49),
              ),
              child: const Center(
                child: Text(
                  '4d',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: h * 0.06),
            textButton(
              context,
              () {
                Get.to(const AddTaskScreen());

                print('Task Added');
              },
              'Add Task',
              h * 0.032,
              w * 0.18,
            ),
          ],
        )
      ],
    ),
  );
}

addTaskDateCard(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: w * 0.02),
          const Text(
            'Start',
            style: TextStyle(fontSize: 5, color: Color(0xffF30909)),
          ),
          SizedBox(width: w * 0.12),
          const Text(
            'End',
            style: TextStyle(fontSize: 5, color: Color(0xff009A49)),
          ),
        ],
      ),
      SizedBox(
        height: h * 0.007,
      ),
      Row(
        children: [
          SizedBox(width: w * 0.02),
          const Text('27-3-2022',
              style: TextStyle(fontSize: 10, color: Color(0xff4E4E4E))),
          SizedBox(width: w * 0.03),
          const Text('27-3-2022',
              style: TextStyle(fontSize: 10, color: Color(0xff4E4E4E))),
        ],
      )
    ],
  );
}
