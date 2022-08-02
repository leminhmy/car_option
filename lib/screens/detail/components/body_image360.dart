import 'dart:math';

import 'package:car_option/widget/label_text.dart';
import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';

class BodyImage360Car extends StatefulWidget {
  const BodyImage360Car({Key? key}) : super(key: key);

  @override
  State<BodyImage360Car> createState() => _BodyImage360CarState();
}

class _BodyImage360CarState extends State<BodyImage360Car> {
  List<ImageProvider> imageList = <ImageProvider>[];
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = const Duration(seconds: 1);
  bool imagePrecached = false;

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 36; i++) {
      imageList.add(AssetImage('assets/images/cars360/$i.png'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/images/cars360/$i.png'), context);
    }
    setState(() {
      imagePrecached = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.all(size.height * 0.05),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(size.height * 0.05),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  shape: BoxShape.circle
              ),
            ),
          ),

          Positioned(
            top: size.height * 0.01,
            child: Transform(
              transform: Matrix4.identity()..
              rotateX(-70/180*pi),
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: CustomPaint(
                  painter: CustomCircle(),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.3,
            width: size.width,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (imagePrecached == true)
                    ? ImageView360(
                  key: UniqueKey(),
                  imageList: imageList,
                  autoRotate: false,
                  rotationCount: 2,
                  rotationDirection: RotationDirection.anticlockwise,
                  frameChangeDuration: Duration(milliseconds: 30),
                  swipeSensitivity: 1,
                  allowSwipeToRotate: true,
                  onImageIndexChanged: (currentImageIndex) {
                    // print("currentImageIndex: $currentImageIndex");
                  },
                )
                    : Row(
                      children: [
                        LabelText(text: "Rendering...",fontSize: size.height * 0.05),
                        const CircularProgressIndicator(),
                      ],
                    ),
              ],
            ),
          ),

          Positioned(
            top: size.height * 0.25,
            bottom: 0,
            child: Container(
              height: size.height * 0.06,
              width: size.height * 0.06,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue
              ),
              child: ImageIcon(AssetImage('assets/icons/left-and-right-arrows.png'),color: Colors.white,size: size.height * 0.03,),
            ),
          )
        ],
      ),
    );
  }
}



class CustomCircle extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Offset center = size.center(Offset.zero);
    Rect rect = Rect.fromCircle(center: center, radius: size.height * 0.19);

    var rainbowPaint = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent,Colors.blue]).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawArc(rect,0,pi*2,false,rainbowPaint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}