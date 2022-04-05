import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../utils/colors.dart';
import '../../widgets/buttons.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,

          backgroundColor: AppColors.bottomNavBackGround,
          selectedItemColor: const Color(0xff217AC0),
          unselectedItemColor: Colors.grey,
          //   AppColors.cardDeepBlue, //New
          currentIndex: 1,
          onTap: null,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: AppColors.cardDeepBlue,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon:
                  Image(image: AssetImage('assets/images/navtaskselected.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                color: AppColors.cardDeepBlue,
              ),
              label: '',
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.07, vertical: h * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.01,
                ),
                backButton(context),
                const SizedBox(
                    child: FittedBox(
                  child: Text(
                    'Add Task',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                )),
                SizedBox(
                  height: h * 0.025,
                ),
                FormBuilderTextField(
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    // labelText: 'Name',
                    hintText: 'Task Name',
                  ),
                  name: 'Task',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    //FormBuilderValidators.required(context),
                  ]),
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: w * 0.37,
                      child: FormBuilderTextField(
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(3.0),
                          // labelText: 'Created(From)',
                          hintText: 'Created(From)',
                        ),
                        name: 'Created',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.37,
                      child: FormBuilderTextField(
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(3.0),
                          // labelText: 'Name',
                          hintText: 'End(To)',
                        ),
                        name: 'End date',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                FormBuilderTextField(
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(3.0),
                    //suffixIcon: ,
                    labelText: 'Add Staff',
                    hintText: 'Add Stff',
                  ),
                  name: 'Add Staff',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                FormBuilderTextField(
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(3.0),
                    labelText: 'Tags',
                    hintText: 'Tags',
                  ),
                  name: 'Tags',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 12, color: Color(0xffB1B0B0)),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                FormBuilderTextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20.0),

                    // labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 0.5),
                    ),
                  ),
                  name: 'Comments',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                ),
                SizedBox(
                  height: h * 0.045,
                ),
                ButtonWidgets(
                  height: h * 0.07,
                  width: w * 0.88,
                  onpressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {}
                    // Get.to(const CreateAccoubtScreen());
                  },
                  title: 'Add Task',
                  gradient: const LinearGradient(
                      colors: [AppColors.gradientStart, AppColors.gradientend]),
                  textColor: AppColors.butonText,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        )));
  }
}
