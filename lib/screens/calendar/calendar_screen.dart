import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../widget/big_text.dart';
import 'components/bottom_option_car.dart';
import 'components/calender_custom.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateRangePickerController dateRangePickerController = DateRangePickerController();
  PickerDateRange pickerDateRange = PickerDateRange(DateTime.now(), DateTime.now().add(const Duration(days: 7)));
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffccd9ef),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size.height * 0.1,
              width: 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.elliptical(size.height, size.height)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffe0dcf1),
                    blurRadius: 30,
                    offset: Offset(0, 0),
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 270,
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.6,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                    Radius.elliptical(size.height, size.height)),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(-1,-.7),
                    child: Container(
                      height: size.height * 0.26,
                      width: size.height * 0.26,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xfffc347f).withOpacity(0.5),Color(0xffedd0ff).withOpacity(0.5)]
                          )
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(1,-0.4),
                    child: Container(
                      height: size.height * 0.26,
                      width: size.height * 0.26,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff8252ff).withOpacity(0.6),Color(0xff2daeb3).withOpacity(0.5)]
                          )
                      ),
                    ),
                  ),
                  BackdropFilter(filter: ImageFilter.blur(sigmaX: 40,sigmaY: 40,)
                    ,child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(

                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            textStyle: TextStyle(
                                fontSize: size.height * 0.025,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),


                        InkWell(
                          onTap: () {
                            dateRangePickerController = DateRangePickerController();
                            pickerDateRange = PickerDateRange(DateTime.now(), DateTime.now().add(const Duration(days: 7)));
                            setState((){});
                          },
                          child: BigText(
                              text: 'Reset',
                              color: Colors.black,
                              fontSize: size.height * 0.025),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CalendarCustom(voidChange: (PickerDateRange? pickerDate){
                    setState(() => pickerDateRange=pickerDate??pickerDateRange);
                  },size: size, dateRangePickerController: dateRangePickerController,),
                  const Spacer(),
                  BottomOptionCar(pickerDateRange: pickerDateRange,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




