import 'package:flutter/material.dart';
import 'package:islom_test/presentation/config/constants.dart';
import 'package:islom_test/presentation/config/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.press,
      required this.text,
      this.outlined = false})
      : super(key: key);

  final Widget text;
  final bool outlined;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenWidth(60),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            double.infinity,
            screenWidth(60),
          ), // double.infinity is the width and 30 is the height
          primary: secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: press,
        child: text,
      ),
    );
  }
}
