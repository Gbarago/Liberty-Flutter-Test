import 'package:app/screens/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/buttons.dart';
import 'ceate_account_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.07, vertical: h * 0.04),
        color: AppColors.backgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: h * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  child: Image(
                      image: AssetImage(
                    'assets/images/dots.png',
                  )),
                ),
                SizedBox(
                  width: w * 0.04,
                ),
                Column(
                  children: [
                    const FittedBox(
                      child: Text(
                        'DO-IT',
                        style: TextStyle(
                            fontSize: 33,
                            color: AppColors.cardDeepBlue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w * 0.133,
                        ),
                        Container(
                          color: AppColors.cardDeepBlue,
                          height: h * 0.0025,
                          width: w * 0.09,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: h * 0.12,
            ),
            SizedBox(
              width: w * 0.1,
              height: h * 0.07,
              child: Image.asset('assets/images/stripedtick.png',
                  fit: BoxFit.cover),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              SizedBox(
                // width: w * 0.1,
                height: h * 0.07,
                child:
                    Image.asset('assets/images/ticks.png', fit: BoxFit.cover),
              ),
              SizedBox(
                width: w * 0.15,
              ),
              SizedBox(
                height: h * 0.075,
                child: Image.asset(
                  'assets/images/folder.png',
                  fit: BoxFit.cover,
                ),
              )
            ]),
            Container(
              height: h * 0.23,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/onboardinimage.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            RichText(
              text: const TextSpan(children: [
                TextSpan(
                  text: 'Just ',
                  style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                TextSpan(
                  text: 'DO-IT',
                  style: TextStyle(
                      color: AppColors.cardDeepBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                )
              ]),
            ),
            SizedBox(
              height: h * 0.025,
            ),
            ButtonWidgets(
              height: h * 0.07,
              width: w * 0.88,
              onpressed: () {
                print('loggin in view nav');
                Get.to(const CreateAccoubtScreen());
              },
              title: 'Create Account',
              gradient: const LinearGradient(
                  colors: [AppColors.gradientStart, AppColors.gradientend]),
              textColor: AppColors.butonText,
              fontSize: 16,
            ),
            SizedBox(
              height: h * 0.005,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style:
                      TextStyle(color: AppColors.greyedOutText, fontSize: 13),
                ),
                GestureDetector(
                  onTap: (() {
                    Get.to(const LoginScreen());
                  }),
                  child: const Text(
                    'Sign in',
                    style:
                        TextStyle(color: AppColors.cardDeepBlue, fontSize: 13),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
