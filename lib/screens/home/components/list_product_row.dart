import 'package:car_option/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_provider.dart';
import '../../../widget/big_text.dart';
import '../../../widget/label_text.dart';

class ListProductWidgetRow extends StatelessWidget {
  const ListProductWidgetRow({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    ListColorThemeModel listColorTheme = context.watch<ThemeProvider>().listColorThemeModel;

    return SizedBox(
      height: size.height * 0.3,
      child:  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(5, (index) => _buildProductCard(context,listColorTheme,index),
            )
        ),
      ),
    );
  }

  _buildProductCard(BuildContext context, ListColorThemeModel listColorTheme, int index) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>const DetailScreen())),
      child: Container(
        width: size.height * 0.2,
        margin: EdgeInsets.only(left: size.height * 0.02),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(size.height * 0.03),
            border: Border.all(
                color: listColorTheme.border,
                width: 3,
                style: index == 0?BorderStyle.solid:BorderStyle.none
            ),
            boxShadow: [
              BoxShadow(
                color: listColorTheme.shadow,
                offset: Offset(0,0),
                spreadRadius: 0,
                blurRadius: 20,
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: listColorTheme.linearGradient
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
    );
  }
}
