import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'CommonUtils.dart';

class MyAssetImage extends StatelessWidget {
  final String imageName;
  String subfolder;
  double width;
  double height;
  bool visibile = true;
  final BoxFit customfit;
  var marginvalue;
  VoidCallback? onItemtaped;
  String icontint;
  String url = "";
  String placeholderimage = "";
  var align;
  MyAssetImage(
      {this.imageName = "null",
      this.subfolder = "images",
      this.width = 18.0,
      this.height = 18.0,
      this.customfit = BoxFit.fill,
      this.marginvalue,
      this.visibile = true,
      this.onItemtaped,
      this.icontint = "#000000",
      this.align,
      this.placeholderimage = "",
      this.url = ""});

  Widget getImage() {
    Widget custwidget;
    if (!CommonUtils.isHavingvalue(url)) {
      custwidget = Image.asset(
        'assets/$subfolder/$imageName',
        width: width,
        height: height,
        fit: customfit,
      );
    } else {
      custwidget = CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: url,
        fit: customfit,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.all(5),
              child: CircularProgressIndicator(
                  value: downloadProgress.progress, strokeWidth: 2.0)),
        ),
        errorWidget: (context, url, error) => Image.asset(
          CommonUtils.isHavingvalue(placeholderimage)
              ? "assets/images/$placeholderimage"
              : 'assets/images/no_image.webp',
          width: width,
          height: height,
          fit: customfit,
        ),
      );
    }
    if (CommonUtils.isHavingvalue(icontint)) {
      return ColorFiltered(
          colorFilter: ColorFilter.mode(
              CommonUtils.getColorFromHex(icontint), BlendMode.srcIn),
          child: custwidget);
    } else {
      return custwidget;
    }
  }

  Widget getSVGImage() {
    Widget custwidget = SvgPicture.asset('assets/$subfolder/$imageName',
        width: width, height: height, fit: customfit);
    if (CommonUtils.isHavingvalue(icontint)) {
      return ColorFiltered(
          colorFilter: ColorFilter.mode(
              CommonUtils.getColorFromHex(icontint), BlendMode.srcIn),
          child: custwidget);
    } else {
      return custwidget;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(" Image svg ${imageName.contains("ic_")}");
    return Visibility(
        visible: visibile,
        child: GestureDetector(
            onTap: onItemtaped,
            child: Container(
                alignment: align,
                margin: marginvalue,
                child:
                    imageName.contains("ic_") ? getSVGImage() : getImage())));
    //throw UnimplementedError();
  }
}
