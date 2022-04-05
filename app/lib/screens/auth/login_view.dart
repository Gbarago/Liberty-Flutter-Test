import 'package:app/screens/auth/ceate_account_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../bloc/auth_bloc.dart';
import '../../utils/colors.dart';
import '../../widgets/buttons.dart';
import '../dashboard/dash_board_scree.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool showObscureText = false;

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      // If email is valid adding new Event [SignInRequested].
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
//
  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  void toggleEye() {
    setState(() {
      showObscureText = !showObscureText;
    });
  }

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          // Navigating to the dashboard screen if the user is authenticated
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const DashBoardScreen()));
        }
        if (state is AuthError) {
          // Showing the error message if the user has entered invalid credentials
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            // Showing the loading indicator while the user is signing in
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UnAuthenticated) {
            // Showing the sign in form if the user is not authenticated
            return Center(
              child: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.07, vertical: h * 0.03),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          backButton(context),
                          SizedBox(
                            height: h * 0.07,
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
                              Column(children: [
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
                              ]),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                  child: FittedBox(
                                child: Text(
                                  'Welcome Back !',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.04,
                          ),
                          SizedBox(
                            height: h * 0.04,
                          ),
                          Center(
                            child: FormBuilder(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FormBuilderTextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      hintText: 'Email',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            const BorderSide(width: 0.5),
                                      ),
                                    ),
                                    name: 'Email',
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: h * 0.03,
                                  ),
                                  FormBuilderTextField(
                                    controller: _passwordController,
                                    obscureText: showObscureText,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.all(20.0),
                                      suffixIcon: InkWell(
                                        onTap: toggleEye,
                                        child: Icon(
                                          showObscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: const Color(0xffC4C4C4),
                                        ),
                                      ),
                                      labelText: 'Password',
                                      hintText: 'Password',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            const BorderSide(width: 0.5),
                                      ),
                                    ),
                                    name: 'Password',
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                      FormBuilderValidators.minLength(
                                          context, 8),
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: h * 0.008),
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: AppColors.greyedOutText,
                                          fontSize: 13),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.05,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ButtonWidgets(
                                        height: h * 0.07,
                                        width: w * 0.63,
                                        onpressed: () {
                                          if (_formKey.currentState!
                                              .saveAndValidate()) {
                                            print(_formKey
                                                .currentState!.value['email']);
                                            print(_formKey.currentState!
                                                .value['password']);
                                          }
                                          _authenticateWithEmailAndPassword(
                                              context);

                                          //print('loggin in view nav');
                                          // Get.to(const DashBoardScreen());
                                        },
                                        title: 'Sign In',
                                        gradient: const LinearGradient(colors: [
                                          AppColors.gradientStart,
                                          AppColors.gradientend
                                        ]),
                                        textColor: AppColors.butonText,
                                        fontSize: 16,
                                      ),
                                      fingerPrint(context)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.008,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  text: 'Don’t have an account? ',
                                  style: const TextStyle(
                                      color: AppColors.greyedOutText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => {
                                              Get.to(
                                                  const CreateAccoubtScreen())
                                            },
                                      text: 'Create Account',
                                      style: const TextStyle(
                                          color: AppColors.cardDeepBlue,
                                          fontSize: 14),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.05,
                          ),
                        ],
                      ),
                    ),
                  )),
            );

            //...)
          }
          return Container();
        },
      ),
    )));
  }
}
