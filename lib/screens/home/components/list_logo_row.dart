import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_provider.dart';

class ListLogoWidgetRow extends StatefulWidget {
  const ListLogoWidgetRow({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ListLogoWidgetRow> createState() => _ListLogoWidgetRowState();
}

class _ListLogoWidgetRowState extends State<ListLogoWidgetRow> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    ListColorThemeModel listColorTheme = context.watch<ThemeProvider>().listColorThemeModel;

    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) => _buildLogoCard(index, listColorTheme),
            )
        ),
      ),
    );
  }

  _buildLogoCard(int index,ListColorThemeModel listColorTheme ) {
    return GestureDetector(
      onTap: () => setState(() => indexSelected = index),
      child: Container(
        height: widget.size.height * 0.09,
        width: widget.size.height * 0.09,
        margin: EdgeInsets.only(left: widget.size.height * 0.02,right: widget.size.height * 0.005),
        decoration: BoxDecoration(
          color:  indexSelected ==index?Colors.lightBlue:listColorTheme.btnBG,
          borderRadius: BorderRadius.circular(widget.size.height * 0.02),
        ),
        child: ImageIcon(AssetImage('assets/images/tesla_logo.png'),color: Colors.white,),
      ),
    );
  }
}
