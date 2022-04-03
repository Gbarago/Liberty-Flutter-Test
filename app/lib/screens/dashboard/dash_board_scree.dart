import 'package:app/utils/colors.dart';
import 'package:app/widgets/app_cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dash_board_controller.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashBoardScreenController dashboardController =
        Get.put(DashBoardScreenController(), permanent: false);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    AppCards appCards = AppCards();
    // int _selectedIndex = 0; //New

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value, //New
          onTap: dashboardController.onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: '',
            ),
          ],
        ),
        body: Container(
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
          ),
        ),
      ),
    );
  }
}
