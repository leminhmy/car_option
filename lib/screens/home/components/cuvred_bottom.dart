import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../widget/small_text.dart';

class CurvedBottom extends StatefulWidget {
  const CurvedBottom({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<CurvedBottom> createState() => _CurvedBottomState();
}

class _CurvedBottomState extends State<CurvedBottom>
    with SingleTickerProviderStateMixin {
  List<double> listValueAnimation = [0.0, 0.203, 0.405, 0.61, 0.815];
  List<double> listValueAnimationBtn = [-1, -0.5, 0, 0.5, 1];

  int selectedIndex = 0;
  int selectedOutIndex = 0;
  late AnimationController _animationController;
  late Animation _animationBG;
  late Animation _animationBtn;
  late Animation _animationBtnAlign;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animationBG =
        Tween<double>(begin: listValueAnimation[4], end: listValueAnimation[0])
            .animate(_animationController);
    _animationBtn = Tween<double>(
            begin: listValueAnimationBtn[4], end: listValueAnimationBtn[0])
        .animate(_animationController);
    _animationBtnAlign =
        Tween<double>(begin: -1.25, end: 5).animate(_animationController);
    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.value > 0.49) {
        _animationBtnAlign =
            Tween<double>(begin: 5, end: -1.25).animate(_animationController);
      }
      if (_animationController.value < 0.5) {
        _animationBtnAlign =
            Tween<double>(begin: -1.25, end: 5).animate(_animationController);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<BottomModel> listNaigator = [
    BottomModel(name: 'Rent', imageIcon: 'assets/icons/car.png'),
    BottomModel(name: 'Bookings', imageIcon: 'assets/icons/calendar.png'),
    BottomModel(name: 'Map', imageIcon: 'assets/icons/map.png'),
    BottomModel(
        name: 'Notifications', imageIcon: 'assets/icons/notification.png'),
    BottomModel(name: 'Account', imageIcon: 'assets/icons/person.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          if (_animationController.isCompleted) {
            selectedOutIndex = selectedIndex;
          }
          return SizedBox(
            height: widget.size.height * 0.135,
            width: widget.size.width,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment:
                      Alignment(_animationBtn.value, _animationBtnAlign.value),
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(45 / 360),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: widget.size.height * 0.01),
                      height: widget.size.height * 0.07,
                      width: widget.size.height * 0.07,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.circular(widget.size.height * 0.023),
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: CustomClipBottom(valueAnimation: _animationBG.value),
                  child: Container(
                    height: widget.size.height * 0.1,
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.size.height * 0.025),
                    width: widget.size.width,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(-0.9,-1),
                          child: Container(
                            width: 1,
                            height: 1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff4aa6f4),
                                      blurRadius: 70,
                                      spreadRadius: 80
                                  ),
                                ]
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.8,1.25),
                          child: Container(
                            width: 1,
                            height: 1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff4aa6f4),
                                      blurRadius: 60,
                                      spreadRadius: 50
                                  ),
                                ]
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            BackdropFilter(filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5,)
                                ,child: Container(
                                    color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widget.size.height * 0.022),
                  child: SizedBox(
                    width: widget.size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          5,
                          (index) => GestureDetector(
                                onTap: () {
                                  print('taped');
                                  if (_animationController.isCompleted ||
                                      _animationController.isDismissed) {
                                    selectedIndex = index;
                                    _animationBG = Tween<double>(
                                            begin: listValueAnimation[
                                                selectedOutIndex],
                                            end: listValueAnimation[index])
                                        .animate(_animationController);
                                    _animationBtn = Tween<double>(
                                            begin: listValueAnimationBtn[
                                                selectedOutIndex],
                                            end: listValueAnimationBtn[index])
                                        .animate(_animationController);
                                    _animationController.reset();
                                    _animationController.forward();
                                  }
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Align(
                                        alignment: selectedIndex == index
                                            ? Alignment(
                                                0, -_animationController.value+0.1)
                                            : selectedOutIndex == index
                                                ? Alignment(
                                                    0,
                                                    -1 +
                                                        _animationController
                                                            .value)
                                                : Alignment.center,
                                        child: ImageIcon(AssetImage(listNaigator[index].imageIcon),color: selectedIndex==index?Colors.white:Colors.black,size: selectedIndex == index
                                            ? widget.size.height * 0.035 +
                                            ((widget.size.height *
                                                0.010) *
                                                _animationController
                                                    .value)
                                            : selectedOutIndex == index
                                            ? widget.size.height * 0.045 -
                                            ((widget.size.height *
                                                0.010) *
                                                _animationController
                                                    .value)
                                            : widget.size.height * 0.030,)),
                                    /*Icon(
                                      Icons.person_rounded,
                                      color: Colors.white,
                                      size: selectedIndex == index
                                          ? widget.size.height * 0.035 +
                                          ((widget.size.height *
                                              0.010) *
                                              _animationController
                                                  .value)
                                          : selectedOutIndex == index
                                          ? widget.size.height * 0.045 -
                                          ((widget.size.height *
                                              0.010) *
                                              _animationController
                                                  .value)
                                          : widget.size.height * 0.035,
                                    )*/
                                    Positioned(
                                        bottom: widget.size.height * 0.02,
                                        left: index == 1 & 3 & 4
                                            ? 0
                                            : index == 2
                                                ? 0
                                                : -15,
                                        child: SmallText(
                                          text: listNaigator[index].name,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              )),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class CustomClipBottom extends CustomClipper<Path> {
  CustomClipBottom({required this.valueAnimation});

  final double valueAnimation;

  @override
  getClip(Size size) {
    double value = size.width * valueAnimation;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.quadraticBezierTo(0, 0, -size.width * 0.05 + value, 0);

    path0.cubicTo(size.width * 0.0 + value, 0, size.width * 0.03 + value,
        size.height * 0.45, size.width * 0.10 + value, size.height * 0.43);

    path0.cubicTo(size.width * 0.15 + value, size.height * 0.4,
        size.width * 0.20 + value, 0, size.width * 0.23 + value, 0);
    path0.quadraticBezierTo(0, 0, size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class BottomModel {
  String imageIcon;
  String name;

  BottomModel({required this.name, required this.imageIcon});
}
