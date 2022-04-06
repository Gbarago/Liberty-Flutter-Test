import 'package:app/screens/dashboard/create_project_screen.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../bloc/auth_bloc.dart';
import '../auth/login_view.dart';
import 'dash_board_controller.dart';
import 'home_screen.dart';
import 'project_list_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  final DashBoardScreenController dashboardController =
      Get.put(DashBoardScreenController(), permanent: false);
  int _selectedIndex = 0; //New
  bool addTask = false;

  @override
  Widget build(BuildContext context) {
    //New
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    final List<Widget> _screens = <Widget>[
      HomeScreen(),
      const ProjectListScreen(),
      // const CreateProjectScreen(),
      const Icon(
        Icons.person_off,
        color: AppColors.cardDeepBlue,
        size: 150,
      ),
    ];

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Center(
        child: Scaffold(
          floatingActionButton: _selectedIndex == 0
              ? FloatingActionButton(
                  backgroundColor: AppColors.cardDeepBlue,
                  onPressed: () {
                    Get.to(const CreateProjectScreen());
                  },
                  child: const Icon(Icons.add),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,

            backgroundColor: AppColors.bottomNavBackGround,
            selectedItemColor: const Color(0xff217AC0),
            unselectedItemColor: Colors.grey,
            //   AppColors.cardDeepBlue, //New
            currentIndex: dashboardController.selectedIndex.value,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? const Icon(Icons.home_rounded)
                    : const Icon(Icons.home_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? const Image(
                        image: AssetImage('assets/images/navtaskselected.png'))
                    : const Image(
                        image: AssetImage('assets/images/navtaskicon.png')),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? const Icon(
                        Icons.person,
                        color: AppColors.cardDeepBlue,
                      )
                    : const Icon(
                        Icons.person_outline_outlined,
                        color: AppColors.cardDeepBlue,
                      ),
                label: '',
              ),
            ],
          ),
          body: BlocListener<AuthBloc, AuthState>(
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
            listener: (context, state) {
              if (state is UnAuthenticated) {
                // Navigate to the sign in screen when the user Signs Out
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
