import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_provider.dart';
import '../../../widget/big_text.dart';
import '../../../widget/label_text.dart';
import '../../../widget/small_text.dart';
class ListProductWidgetColumn extends StatelessWidget {
  const ListProductWidgetColumn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    ListColorThemeModel listColorTheme = context.watch<ThemeProvider>().listColorThemeModel;
    return  Column(
      children: [
        ListView.builder(
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => _buildCard(index, listColorTheme)),
      ],
    );
  }

   _buildCard(int index, ListColorThemeModel listColorTheme) {
    return Container(
            height: size.height * 0.2,
            margin: EdgeInsets.only(right: size.height * 0.02,left: size.height * 0.02,bottom: size.height * 0.02,),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(size.height * 0.03),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: listColorTheme.linearGradient
                )
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
          );
  }
}
