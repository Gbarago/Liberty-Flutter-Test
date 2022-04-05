import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../widgets/app_cards.dart';
import '../../widgets/buttons.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    AppCards appCards = AppCards();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 0.07, vertical: h * 0.04),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: h * 0.04,
        ),
        backButton(context),
        const SizedBox(
          child: FittedBox(
            child: Text(
              'Projects',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          height: h * 0.04,
        ),
        Expanded(
            child: Container(
          color: AppColors.backgroundColor,
          child: ListView(
            children: [
              appCards.taskinProgressCard(context),
              appCards.taskinProgressCard(context),
              appCards.taskinProgressCard(context),
              appCards.taskinProgressCard(context),
              appCards.taskinProgressCard(context),
              appCards.taskinProgressCard(context),
              appCards.taskinProgressCard(context),
              appCards.taskinProgressCard(context),
              appCards.taskinProgressCard(context),
            ],
          ),
        ))
      ]),
    );
  }
}
