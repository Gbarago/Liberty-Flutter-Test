import 'package:app/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import '../data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/auth_repository.dart';
import 'screens/auth/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context),
          ),
          child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Liberty Test',
              theme: ThemeData(
                fontFamily: 'Mark-Pro',
                primarySwatch: Colors.blue,
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
              }),
        ));
  }
}
