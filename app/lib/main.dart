import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/auth/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Liberty Test',
        theme: ThemeData(
          fontFamily: 'Mark-Pro',
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          primaryColor: const Color(0xffB01D22),
        ),
        supportedLocales: const [
          Locale('de'),
          Locale('en'),
          Locale('es'),
          Locale('fr'),
          Locale('it'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FormBuilderLocalizations.delegate,
        ],
        routes: {
          '/': (context) => const OnboardingScreen(),

          // getPages: [

          //   GetPage(binding: , name: '')
          // ],
        });
  }
}
