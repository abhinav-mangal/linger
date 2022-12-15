import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    Key? key,
    this.onTap,
    required this.title,
    this.outlineBorderColor,
    this.withShadow,
    this.titleStyle,
    this.isEnabled,
    this.borderRadius,
  }) : super(key: key);
  final String title;
  final VoidCallback? onTap;
  final Color? outlineBorderColor;
  final TextStyle? titleStyle;
  final bool? withShadow;
  final double? borderRadius;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: isEnabled ?? true ? onTap : null,
      child: withShadow ?? false
          ? Opacity(
              opacity: isEnabled ?? true ? 0.99 : 0.5,
              child: Container(
                height: 6.39.h,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius ?? 15)),
                  border: Border.all(
                    color: outlineBorderColor ?? Colors.green,
                  ),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          : Opacity(
              opacity: isEnabled ?? true ? 0.99 : 0.5,
              child: Container(
                height: 6.39.h,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius ?? 15)),
                  border: Border.all(
                    color: outlineBorderColor ?? Colors.green,
                  ),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
    );
  }
}
