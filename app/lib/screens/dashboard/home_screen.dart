import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/app_cards.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  AppCards appCards = AppCards();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
        padding:
            EdgeInsets.only(top: h * 0.05, left: w * 0.07, right: w * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi Dexter ',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Welcome onboard ',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.cardDeepBlue),
            ),
            SizedBox(height: h * 0.05),
            SizedBox(
              height: h * 0.375,
              child: GridView.count(
                //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 2,

                crossAxisSpacing: 20,
                childAspectRatio: 1.2,
                mainAxisSpacing: 20,

                children: [
                  appCards.overviewCards(context,
                      imgUrl: 'assets/images/projectstask.png',
                      figure: '14',
                      title: 'projects',
                      cardColor: AppColors.cardOrange,
                      avatarColor: AppColors.cardDeepOrange),
                  appCards.overviewCards(context,
                      imgUrl: 'assets/images/task.png',
                      figure: '24',
                      title: 'Tasks',
                      cardColor: AppColors.cardBlue,
                      avatarColor: AppColors.cardDeepBlue),
                  appCards.overviewCards(context,
                      imgUrl: 'assets/images/completedtask.png',
                      figure: '12',
                      title: 'Completed Task',
                      cardColor: AppColors.cardGreen,
                      avatarColor: AppColors.cardGreen),
                  appCards.overviewCards(context,
                      imgUrl: 'assets/images/overduetask.png',
                      figure: '2',
                      title: 'Overdue Task',
                      cardColor: AppColors.cardGrey,
                      avatarColor: AppColors.cardDeepGrey),
                ],
              ),
            ),
            SizedBox(height: h * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Task in Progress',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                Text('See All',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.cardDeepBlue))
              ],
            ),
            SizedBox(height: h * 0.02),
            Container(
              color: AppColors.backgroundColor,
              height: h * 0.26,
              child: ListView(
                children: [
                  appCards.taskinProgressCard(context),
                  appCards.taskinProgressCard(context),
                  appCards.taskinProgressCard(context),
                ],
              ),
            )
          ],
        ));
  }
}
