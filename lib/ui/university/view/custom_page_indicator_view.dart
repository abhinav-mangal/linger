import 'package:flutter/material.dart';
import '../../../Basepackage/baseclass.dart';

class PageIndicatorView extends StatelessWidget with baseclass {
  const PageIndicatorView(
      {Key? key,
      required this.selected,
      this.selectedColor,
      this.unselectedColor,
      this.width})
      : super(key: key);
  final bool selected;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      height: getH(
        width ?? 15.00,
      ),
      width: getW(
        width ?? 15.00,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected
            ? selectedColor ?? Colors.red
            : unselectedColor ?? Colors.grey.shade500,
      ),
      child: Container(
        height: 10,
        width: 10,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade500,
        ),
      ),
    );
  }
}
