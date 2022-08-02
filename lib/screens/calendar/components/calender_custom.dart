import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarCustom extends StatelessWidget {
  const CalendarCustom({
    Key? key,
    required this.size, required this.voidChange, required this.dateRangePickerController,
  }) : super(key: key);

  final Size size;
  final ValueChanged<PickerDateRange?> voidChange;
  final DateRangePickerController dateRangePickerController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      margin:
      EdgeInsets.symmetric(horizontal: size.height * 0.02),
      padding: EdgeInsets.all(size.height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height * 0.03),
        color: Colors.white.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurStyle: BlurStyle.outer,
            blurRadius: 15,
            spreadRadius: 0
          ),
        ]
      ),
      child: SfDateRangePicker(
        controller: dateRangePickerController,
        selectionMode: DateRangePickerSelectionMode.range,
        onSelectionChanged: (DateRangePickerSelectionChangedArgs datePicker) {
          voidChange(datePicker.value);
        },
        headerStyle: DateRangePickerHeaderStyle(
            textAlign: TextAlign.center,
            textStyle: GoogleFonts.passionOne(
              textStyle: TextStyle(
                  fontSize: size.height * 0.035,

                  fontWeight: FontWeight.w100,
                  color: Colors.black),
            )
        ),
        selectionTextStyle: TextStyle(
            fontSize: size.height * 0.02,
            fontWeight: FontWeight.w500,
            color: Colors.white),
        rangeSelectionColor: Colors.lightBlue.withOpacity(0.3),
        rangeTextStyle: TextStyle(
            fontSize: size.height * 0.02,
            fontWeight: FontWeight.w500,
            color: Colors.white),
        monthViewSettings: DateRangePickerMonthViewSettings(
            viewHeaderStyle: DateRangePickerViewHeaderStyle(
                textStyle: GoogleFonts.passionOne(
                  textStyle: GoogleFonts.passionOne(
                    textStyle: TextStyle(
                        fontSize: size.height * 0.035,

                        fontWeight: FontWeight.w100,
                        color: Colors.black),
                  )
                )
            )
        ),
        monthCellStyle: DateRangePickerMonthCellStyle(
          textStyle: TextStyle(
              fontSize: size.height * 0.02,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
    );
  }
}
