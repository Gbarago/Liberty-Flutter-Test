import 'package:app/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/colors.dart';
import '../../widgets/buttons.dart';
import '../dashboard/dash_board_scree.dart';

class CreateAccoubtScreen extends StatefulWidget {
  const CreateAccoubtScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccoubtScreen> createState() => _CreateAccoubtScreen();
}

class _CreateAccoubtScreen extends State<CreateAccoubtScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      // If email is valid adding new event [SignUpRequested].
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(_nameController.text, _emailController.text,
            _phoneNumberController.text, _passwordController.text),
      );
    }
  }

//
  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  final _formKey = GlobalKey<FormBuilderState>();
  bool showObscureText = false;

  void toggleEye() {
    setState(() {
      showObscureText = !showObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashBoardScreen()));
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
                        horizontal: w * 0.07, vertical: h * 0.04),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: h * 0.04,
                          ),
                          backButton(context),
                          const SizedBox(
                              child: FittedBox(
                            child: Text(
                              'Create\nAccount',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                          )),
                          SizedBox(
                            height: h * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                    text: 'Please fill the details below to\n',
                                    style: TextStyle(
                                        color: AppColors.black, fontSize: 14),
                                    children: [
                                      TextSpan(
                                        text: 'create a ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'DO-IT ',
                                        style: TextStyle(
                                            color: AppColors.cardDeepBlue,
                                            fontSize: 17),
                                      ),
                                      TextSpan(
                                        text: 'account ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
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
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.all(20.0),
                                      labelText: 'Name',
                                      hintText: 'Name',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            const BorderSide(width: 0.5),
                                      ),
                                    ),
                                    name: 'name',
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                      //FormBuilderValidators.required(context),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: h * 0.03,
                                  ),
                                  FormBuilderTextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.all(20.0),
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
                                    controller: _phoneNumberController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.all(20.0),

                                      //suffixIcon: ,
                                      labelText: 'Mobile Number',
                                      hintText: 'Mobile Number',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(),
                                      ),
                                    ),
                                    name: 'Number',
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                      FormBuilderValidators.numeric(context),
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
                                      'Password must be atleast 8 characters',
                                      style: TextStyle(
                                          color: AppColors.greyedOutText,
                                          fontSize: 13),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.05,
                                  ),
                                  ButtonWidgets(
                                    height: h * 0.07,
                                    width: w * 0.88,
                                    onpressed: () {
                                      if (_formKey.currentState!
                                          .saveAndValidate()) {
                                        print(_formKey
                                            .currentState!.value['email']);
                                        print(_formKey
                                            .currentState!.value['password']);
                                      }
                                      print('loggin in view nav');
                                      _authenticateWithEmailAndPassword(
                                          context);

                                      // Get.to(const CreateAccoubtScreen());
                                    },
                                    title: 'Create Account',
                                    gradient: const LinearGradient(colors: [
                                      AppColors.gradientStart,
                                      AppColors.gradientend
                                    ]),
                                    textColor: AppColors.butonText,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Center(
                              child: Text('Privacy policy',
                                  style: TextStyle(
                                    color: AppColors.greyedOutText,
                                    fontSize: 13,
                                    decoration: TextDecoration.underline,
                                  ))),
                          SizedBox(
                            height: h * 0.05,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );

              //...)
            }
            return Container();
          },
        ),
      ),
    );
  }
}
