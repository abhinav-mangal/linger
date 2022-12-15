import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      this.onTap,
      this.title,
      this.color,
      this.titleStyle,
      this.radius,
      this.customChild,
      this.padding})
      : super(key: key);
  final VoidCallback? onTap;
  final String? title;
  final Color? color;
  final TextStyle? titleStyle;
  final double? radius;
  final Widget? customChild;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 6.39.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? Colors.green,
          borderRadius: BorderRadius.circular(radius ?? 12.sp),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(5.0),
          child: customChild ??
              Text(
                title ?? '',
                style: titleStyle ??
                    TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
              ),
        ),
      ),
    );
  }
}
