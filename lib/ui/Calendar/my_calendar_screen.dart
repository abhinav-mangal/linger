import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'controller.dart';
import 'widget.dart';
import '../widgets/screen_conatiner.dart';

class MyCalendarScreen extends StatefulWidget {
  const MyCalendarScreen({Key? key}) : super(key: key);

  @override
  State<MyCalendarScreen> createState() => _MyCalendarScreenState();
}

class _MyCalendarScreenState extends State<MyCalendarScreen> {
  final _calendarControllerToday = AdvancedCalendarController.today();
  final _calendarControllerCustom =
      AdvancedCalendarController.custom(DateTime.now());
  final List<DateTime> events = [
    DateTime.utc(2022, 09, 14, 12),
    DateTime.utc(2022, 09, 15, 12)
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScreenContainer(
      title: 'My Calendar',
      centerTitle: true,
      appBarElevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.add,
            size: 22.sp,
          ),
          onPressed: () {},
          color: theme.iconTheme.color,
        )
      ],
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Theme(
              data: ThemeData.light().copyWith(
                textTheme: ThemeData.light().textTheme.copyWith(
                      subtitle1:
                          ThemeData.light().textTheme.subtitle1?.copyWith(
                                fontSize: 16.sp,
                                color: theme.colorScheme.secondary,
                              ),
                      bodyText1:
                          ThemeData.light().textTheme.bodyText1?.copyWith(
                                fontSize: 16.sp,
                                color: Colors.black54,
                              ),
                      bodyText2:
                          ThemeData.light().textTheme.bodyText1?.copyWith(
                                fontSize: 16.sp,
                                color: Colors.black87,
                              ),
                    ),
                primaryColor: Colors.red,
                highlightColor: Colors.yellow,
                disabledColor: Colors.grey.withOpacity(0.6),
              ),
              child: AdvancedCalendar(
                controller: _calendarControllerCustom,
                events: events,
                weekLineHeight: 48.0,
                startWeekDay: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
