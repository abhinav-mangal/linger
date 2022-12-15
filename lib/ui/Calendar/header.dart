part of 'widget.dart';

class Header extends StatelessWidget with baseclass {
  const Header({
    Key? key,
    required this.monthDate,
    this.margin = const EdgeInsets.only(
      left: 16.0,
      right: 8.0,
      top: 4.0,
      bottom: 4.0,
    ),
    this.onPressed,
    this.dateStyle,
    this.todayStyle,
  }) : super(key: key);

  static final _dateFormatter = DateFormat('dd MMM,yyyy');
  // static final _dateFormatter1 = DateFormat().add_d();
  final DateTime monthDate;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onPressed;
  final TextStyle? dateStyle;
  final TextStyle? todayStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Today',
              //   style: todayStyle ?? theme.textTheme.subtitle1!,
              // ),
              CustomText(
                onItemtaped: onPressed,
                textalign: TextAlign.center,
                text: "Today",
                familytype: 2,
                textsize: 18.sp,
                textcolor: getColorFromHex(ColorConstants.lightblueishcolor),
              ),
              CustomText(
                textalign: TextAlign.center,
                text: _dateFormatter.format(DateTime.now()),
                familytype: 1,
                textsize: 18.sp,
                textcolor: getColorFromHex(ColorConstants.black),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 4.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  textalign: TextAlign.center,
                  text: "Muharram",
                  familytype: 2,
                  textsize: 18.sp,
                  textcolor: getColorFromHex(ColorConstants.black),
                ),
                CustomText(
                  textalign: TextAlign.center,
                  text: "1444th Islamic New Year",
                  familytype: 1,
                  textsize: 18.sp,
                  textcolor: getColorFromHex(ColorConstants.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
