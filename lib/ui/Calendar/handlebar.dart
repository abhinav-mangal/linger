part of 'widget.dart';

class HandleBar extends StatelessWidget with baseclass {
  const HandleBar({
    Key? key,
    this.decoration,
    this.margin = const EdgeInsets.only(
      top: 8.0,
    ),
    this.onPressed,
  }) : super(key: key);

  final BoxDecoration? decoration;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: margin,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: getH(1),
              width: getW(21),
              margin: EdgeInsets.only(bottom: getH(3)),
              decoration: decoration ??
                  BoxDecoration(
                    color: getColorFromHex(ColorConstants.greyicolor)
                        .withOpacity(0.3),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
            ),
            Container(
              height: getH(1),
              width: getW(29),
              decoration: decoration ??
                  BoxDecoration(
                    color: getColorFromHex(ColorConstants.greyicolor)
                        .withOpacity(0.3),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
