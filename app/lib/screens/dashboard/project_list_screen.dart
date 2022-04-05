import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../widgets/app_cards.dart';
import '../../widgets/buttons.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 0.07, vertical: h * 0.04),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: h * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton(context),
            textButton(
              context,
              () {},
              'Create Project',
              h * 0.032,
              w * 0.2,
            )
          ],
        ),
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
              projectListCard(context),
              projectListCard(context),
              projectListCard(context),
              projectListCard(context),
              projectListCard(context),
              projectListCard(context),
              projectListCard(context),
              projectListCard(context),
              projectListCard(context),
            ],
          ),
        ))
      ]),
    );
  }
}
