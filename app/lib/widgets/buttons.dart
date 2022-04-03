import 'package:flutter/material.dart';

import '../utils/colors.dart';

// ignore: must_be_immutable
class ButtonWidgets extends StatelessWidget {
  ButtonWidgets({
    Key? key,
    this.height,
    this.width,
    this.onpressed,
    this.title,
    this.gradient,
    this.color,
    this.textColor,
    this.fontSize,
    this.borderColor,
  }) : super(key: key);
  final double? height;
  final double? width;
  final Function()? onpressed;
  final String? title;
  final gradient;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final Color? borderColor;
  var fontWeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: gradient,
          color: color,
          border:
              Border.all(width: 1.0, color: borderColor ?? Colors.transparent),
        ),
        child: MaterialButton(
          onPressed: onpressed,
          child: FittedBox(
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontWeight: fontWeight = FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

backButton(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: h * 0.08,
          decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]),
          child: const Image(
              image: AssetImage(
            'assets/images/back.png',
          )),
        ),
      ),
    ],
  );
}

fingerPrint(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return InkWell(
    child: Container(
      height: h * 0.07,
      width: w * 0.15,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.cardDeepBlue,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Image(
          image: AssetImage(
        'assets/images/finger.png',
      )),
    ),
  );
}
