import 'package:flutter/material.dart';
import 'package:linger/Utils/colors.dart';

import 'AssetImage.dart';

typedef RatingChangeCallback = void Function(double rating);

class Customrating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;
  final double width;
  final double height;
  final double side;
  final double above;
  var marigin;
  Customrating(
      {this.starCount = 5,
      this.rating = .0,
      this.color,
      this.marigin,
      this.onRatingChanged,
      this.width = 19.0,
      this.height = 18.0,
      this.side = 15.0,
      this.above = 10.0});

  Widget buildStar(BuildContext context, int index) {
    Widget icon;
    if (index >= rating) {
      icon = MyAssetImage(
        imageName: "ic_emptystar.svg",
        height: height,
        width: width,
        icontint: ColorConstants.greycolor,
      );
      // icon = new Icon(
      //   Icons.star_border,
      //   color: Theme.of(context).buttonColor,
      //   size: size,
      // );
    } else if (index > rating - 1 && index < rating) {
      icon = MyAssetImage(
        imageName: "ic_halfStar.svg",
        height: height,
        width: width,
        icontint: '',
      );
    } else {
      icon = MyAssetImage(
        imageName: "ic_star.svg",
        height: height,
        width: width,
        icontint: '',
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(side, above, side, above),
        child: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
