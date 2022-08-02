import 'package:car_option/widget/small_text.dart';
import 'package:flutter/material.dart';

import 'label_text.dart';

class TextInContainBorder extends StatelessWidget {
  const TextInContainBorder(
      {Key? key,
        required this.iconData,
        required this.text,
        required this.label})
      : super(key: key);

  final IconData iconData;
  final String text;
  final String label;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(
          text: label,
          fontWeight: FontWeight.w100,
          fontSize: size.height * 0.03,
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          height: size.height * 0.07,
          padding: EdgeInsets.only(
              top: size.height * 0.006,
              bottom: size.height * 0.006,
              left: size.height * 0.006,
              right: size.height * 0.01),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(size.height * 0.035)),
          child: Row(
            children: [
              Container(
                height: size.height * 0.07,
                width: size.height * 0.06,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: size.height * 0.01,
              ),
              SmallText(
                text: text,
                color: Colors.grey.shade600,
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
      ],
    );
  }
}
