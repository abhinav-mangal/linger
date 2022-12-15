part of 'widget.dart';

/// Week day names line.
class WeekDays extends StatelessWidget with baseclass {
  const WeekDays({
    Key? key,
    this.weekNames = const <String>['S', 'M', 'T', 'W', 'T', 'F', 'S'],
    this.style,
    this.digit,
  })  : assert(weekNames.length == 7, '`weekNames` must have length 7'),
        super(key: key);

  /// Week day names.
  final List<String> weekNames;

  /// Text style.
  final TextStyle? style;

  /// substring
  final int? digit;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: style!,
      child: Container(
        margin: EdgeInsets.only(left: getW(20), right: getW(20)),
        height: getH(50),
        decoration: BoxDecoration(
          color: getColorFromHex(ColorConstants.lightblueishcolor)
              .withOpacity(0.30),
          borderRadius: BorderRadius.all(Radius.circular(25.sp)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(weekNames.length, (index) {
            return DateBox(
              child: CustomText(
                textalign: TextAlign.center,
                text: weekNames[index].substring(0, digit),
                familytype: 3,
                textsize: 16.sp,
                textcolor: getColorFromHex(ColorConstants.black),
              ),
            );
          }),
        ),
      ),
    );
  }
}
