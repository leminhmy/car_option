import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../../../widget/big_text.dart';
import '../../../widget/label_text.dart';
import '../../../widget/text_in_container_border.dart';
import '../calendar_screen.dart';

class BottomOptionCar extends StatelessWidget {
  const BottomOptionCar({
    Key? key, required this.pickerDateRange,
  }) : super(key: key);

  final PickerDateRange pickerDateRange;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("dd MMM yyyy");
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.39,
        width: double.maxFinite,
        padding: EdgeInsets.all(size.height * 0.02),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            boxShadow: const[
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 1)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.height * 0.04),
                topRight: Radius.circular(size.height * 0.04))),
        child: Column(
          children: [
           const TextInContainBorder(
                label: 'PICK UP CAR',
                text: 'Tesla Montral-Ferrier',
                iconData: Icons.navigation_rounded),
            SizedBox(
              height: size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: TextInContainBorder(
                      label: 'START',
                      text: dateFormat.format(pickerDateRange.startDate??DateTime.now()).toString(),
                      iconData: Icons.calendar_month,
                    )),
                SizedBox(
                  width: size.height * 0.02,
                ),
                Expanded(
                    child: TextInContainBorder(
                        label: 'END',
                        text: dateFormat.format(pickerDateRange.endDate??DateTime.now()).toString(),
                        iconData: Icons.calendar_month)),
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Container(
                        height: size.height * 0.07,
                        alignment: Alignment.center,
                        child: BigText(
                          text: 'Total: \$900',
                          fontSize: size.height * 0.025,
                          color: Colors.black,
                        ))),
                Expanded(
                  child: Container(
                    height: size.height * 0.07,
                    padding: EdgeInsets.only(
                        top: size.height * 0.006,
                        bottom: size.height * 0.006,
                        left: size.height * 0.006,
                        right: size.height * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(
                            size.height * 0.035)),
                    child: Row(
                      children: [
                        Container(
                          height: size.height * 0.07,
                          width: size.height * 0.06,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: const Icon(
                            Icons.fingerprint_outlined,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: size.height * 0.01,
                        ),
                        LabelText(
                          text: 'Pay Now',
                          color: Colors.white,
                          fontSize: size.height * 0.03,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}