import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color textcolor;
  final double textsize;
  final int familytype;
  final TextAlign textalign;
  final VoidCallback? onItemtaped;
  final FontWeight? fontWeight;
  var marginvalue;
  var linecount;
  var decorationval;
  var align;
  var overflow;
  bool softwrap;
  CustomText(
      {this.text = "",
      this.textcolor = Colors.black,
      this.textsize = 14.0,
      this.familytype = 1,
      this.textalign = TextAlign.start,
      this.linecount,
      this.overflow,
      this.fontWeight,
      this.onItemtaped,
      this.marginvalue,
      this.decorationval,
      this.align,
      this.softwrap = true});

  @override
  Widget build(BuildContext context) {
    TextStyle tstyle = TextStyle(
        fontFamily: 'Reguler',
        fontSize: textsize,
        color: textcolor,
        decoration: decorationval,
        fontWeight: fontWeight);
    if (familytype == 1) {
      tstyle = TextStyle(
          fontWeight: fontWeight,
          fontFamily: 'Reguler',
          fontSize: textsize,
          color: textcolor,
          decoration: decorationval);
    } else if (familytype == 2) {
      tstyle = TextStyle(
          fontFamily: 'Medium',
          fontSize: textsize,
          color: textcolor,
          decoration: decorationval,
          fontWeight: fontWeight);
    } else if (familytype == 3) {
      tstyle = TextStyle(
          fontFamily: 'Bold',
          fontSize: textsize,
          color: textcolor,
          decoration: decorationval,
          fontWeight: fontWeight);
    } else if (familytype == 4) {
      tstyle = TextStyle(
          fontFamily: 'Italic',
          fontSize: textsize,
          color: textcolor,
          decoration: decorationval,
          fontWeight: fontWeight);
    } else if (familytype == 5) {
      tstyle = TextStyle(
          fontFamily: 'Light',
          fontSize: textsize,
          color: textcolor,
          decoration: decorationval,
          fontWeight: fontWeight);
    } else if (familytype == 6) {
      tstyle = TextStyle(
          fontFamily: 'SemiBold',
          fontSize: textsize,
          color: textcolor,
          decoration: decorationval,
          fontWeight: fontWeight);
    } else if (familytype == 7) {
      tstyle = TextStyle(
          fontFamily: 'SF Pro Display',
          fontSize: textsize,
          color: textcolor,
          decoration: decorationval,
          fontWeight: fontWeight);
    } else if (familytype == 8) {
      tstyle = TextStyle(
          fontFamily: 'AlumniRegular',
          fontSize: textsize,
          color: textcolor,
          decoration: decorationval,
          fontWeight: fontWeight);
    }
    // TODO: implement build
    return Container(
      alignment: align,
      margin: marginvalue,
      child: GestureDetector(
          onTap: onItemtaped,
          child: Text(
            text,
            textAlign: textalign,
            style: tstyle,
            maxLines: linecount,
            overflow: overflow,
            softWrap: softwrap,
          )),
    );

    //throw UnimplementedError();
  }
}
