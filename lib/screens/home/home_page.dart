import 'dart:math';

import 'package:car_option/widget/big_text.dart';
import 'package:car_option/widget/label_text.dart';
import 'package:car_option/widget/small_text.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/cuvred_bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffccd9ef),

      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 250,
              width: 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(700, 1000)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffe0dcf1),
                    blurRadius: 30,
                    offset: Offset(0,0),
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 270,
                  )
                ],
              ),
            ),
            SafeArea(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        LabelText(text: 'SELECT CAR'),
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/avatar.jpg'),
                          maxRadius: 30,
                        )
                      ],
                  ),
                ),
                Container(
                  height: size.height * 0.3,
                  width: size.height * 0.2,
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(size.height * 0.03),
                    border: Border.all(
                      color: Color(0xff2e2e2e).withOpacity(0.2),
                      width: 3,
                      style: BorderStyle.solid
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffdbd4f7).withOpacity(0.5),
                          offset: Offset(0,20),
                          spreadRadius: 0,
                          blurRadius: 20,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Color(0xffdbd4f7),
                      ]
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height * 0.18,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/car3.png'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal:size.height * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: 'ELECTRIC',color: Colors.grey.shade600,fontSize: size.height * 0.018,),
                                  LabelText(text: 'Tesla Model Y',fontSize: size.height * 0.02,),
                                  Spacer(),
                                  BigText(text: '\$150 /Day',color: Colors.grey.shade600,fontSize: size.height * 0.02,),
                                  SizedBox(height: size.height * 0.02,),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: size.height * 0.06,
                                width: size.height * 0.06,
                                padding: EdgeInsets.all(size.height * 0.01),
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(size.height * 0.025),topLeft: Radius.circular(size.height * 0.025)),
                                ),
                                child: ImageIcon(AssetImage('assets/icons/forward_arrow.png'),color: Colors.white,),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.only(left: size.height * 0.02),
                  decoration: BoxDecoration(
                    color: Color(0xffbbb5d5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ImageIcon(AssetImage('assets/images/tesla_logo.png'),color: Colors.white,),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 200,
                  margin: EdgeInsets.only(right: size.height * 0.02,left: size.height * 0.02,bottom: size.height * 0.02,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(size.height * 0.03),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.height * 0.01,vertical: size.height * 0.020),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                child: Image.asset('assets/images/car1.png',fit: BoxFit.cover,)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  BigText(text: 'ELECTRIC',color: Colors.grey.shade600,),
                                  SizedBox(height: 5,),
                                  LabelText(text: 'TESLA ROADSTER',color: Colors.black,fontSize: size.height * 0.025,),
                                  SizedBox(height: 5,),
                                  SmallText(text: '\$200 /Day',color: Colors.grey.shade600,fontWeight: FontWeight.w700,),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: size.height * 0.06,
                          width: size.height * 0.11,
                          padding: EdgeInsets.all(size.height * 0.01),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(size.height * 0.025),topLeft: Radius.circular(size.height * 0.025)),
                          ),
                          child: ImageIcon(AssetImage('assets/icons/forward_arrow.png'),color: Colors.white,),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),

            Positioned(
              bottom: 0,
              child: CurvedBottom(size: size),
            )
          ],
        ),
      ),
      /*bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),*/
    );
  }
}



