import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'CommonUtils.dart';
import 'colors.dart';

class RoundButton extends StatelessWidget {
  Widget? textchild;
  callback? onItemtabed;
  double? width, height;
  double roundradius;
  double? blurRadius;
  double opaacity;
  var marginvalue;
  String? startcolor, endcolor, boxShadowcolor = ColorConstants.grey;

  RoundButton(
      {this.textchild,
      this.onItemtabed,
      this.width,
      this.height,
      this.opaacity = 1.0,
      this.roundradius = 20,
      this.blurRadius,
      this.marginvalue,
      this.startcolor,
      this.endcolor,
      this.boxShadowcolor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onItemtabed,
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(roundradius),
              side: BorderSide(
                  color: CommonUtils.getColorFromHex('$boxShadowcolor')
                      .withOpacity(opaacity),
                  width: 1.0)),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CommonUtils.getColorFromHex('$startcolor')
                        .withOpacity(opaacity),
                    CommonUtils.getColorFromHex('$endcolor')
                        .withOpacity(opaacity),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(roundradius)),
            child: Container(
              constraints: const BoxConstraints(minHeight: 50.0),
              alignment: Alignment.center,
              child: textchild,
            ),
          ),
        ),
      ),
    );
  }
}
