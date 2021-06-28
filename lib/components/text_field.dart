import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String displayText;
  const CustomText({
    Key? key, required this.displayText,
  }) : assert(displayText != '');

  @override
  Widget build(BuildContext context) {
    return Text(displayText,
        style:
        TextStyle(fontWeight: FontWeight.w500));
  }
}