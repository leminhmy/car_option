import 'package:flutter/material.dart';

import '../../../widget/big_text.dart';
import '../../../widget/label_text.dart';
import '../../../widget/small_text.dart';
import '../../calendar/calendar_screen.dart';

class BottomDesProduct extends StatelessWidget {
  const BottomDesProduct({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    String textDescription = 'Park for a few hours or stay overnight. With over 35,000 Wall Connectors at Destination Charging locations in both urban and rural areas, there’s likely a Tesla charging station waiting for you at the end of your trip. Recharge at popular hotels, restaurants and resorts.';

    return Container(
      height: size.height * 0.4,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: size.height * 0.01),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 1
            )
          ],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(size.height * 0.04),topRight: Radius.circular(size.height * 0.04))
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(size.height * 0.02),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: 'ELECTRIC INNOVATION',color: Colors.grey.shade600,),
                SizedBox(height: size.height * 0.02,),
                LabelText(text: 'TESLA MODEL Y',fontSize: size.height * 0.035,),
                SizedBox(height: size.height * 0.02,),
                SmallText(text: textDescription,color: Colors.grey.shade600,fontWeight: FontWeight.w600,),
                SizedBox(height: size.height * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/icons/bolt_car.png',height: 40,width: 40,),
                        SmallText(text: 'Electric',color: Colors.grey.shade600,fontWeight: FontWeight.w600,),

                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/icons/bolt_car.png',height: 40,width: 40,),
                        SmallText(text: 'Electric',color: Colors.grey.shade600,fontWeight: FontWeight.w600,),

                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/icons/bolt_car.png',height: 40,width: 40,),
                        SmallText(text: 'Electric',color: Colors.grey.shade600,fontWeight: FontWeight.w600,),

                      ],
                    ),
                  ],
                ),
                Spacer(),
                BigText(text: '\$150/ Day',color: Colors.black,fontSize: size.height * 0.02),
                SizedBox(height: 10,),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child:  GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>const CalendarScreen())),
              child: Container(
                height: size.height * 0.07,
                width: size.height * 0.2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(size.height * 0.025)),
                ),
                child: LabelText(text: 'Book Now',color: Colors.white,fontWeight: FontWeight.w100,fontSize: size.height * 0.03),
              ),
            ),
          )
        ],
      ),
    );
  }
}
