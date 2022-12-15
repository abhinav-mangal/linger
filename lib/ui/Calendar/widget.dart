import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linger/ui/Calendar/eventsquarebox.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import 'calendarroundbutton.dart';
import 'controller.dart';
import 'datetime_util.dart';
import 'eventBox.dart';

part 'date_box.dart';

part 'handlebar.dart';

part 'header.dart';

part 'month_view.dart';

part 'month_view_bean.dart';

part 'week_days.dart';

part 'week_view.dart';

/// Advanced Calendar widget.
class AdvancedCalendar extends StatefulWidget {
  const AdvancedCalendar({
    Key? key,
    this.controller,
    this.startWeekDay,
    this.events,
    this.weekLineHeight = 32.0,
    this.preloadMonthViewAmount = 13,
    this.preloadWeekViewAmount = 21,
    this.weeksInMonthViewAmount = 6,
    this.todayStyle,
    this.dateStyle,
    this.onHorizontalDrag,
    this.innerDot = false,
  }) : super(key: key);

  /// Calendar selection date controller.
  final AdvancedCalendarController? controller;

  /// Executes on horizontal calendar swipe. Allows to load additional dates.
  final Function(DateTime)? onHorizontalDrag;

  /// Height of week line.
  final double weekLineHeight;

  /// Amount of months in month view to preload.
  final int preloadMonthViewAmount;

  /// Amount of weeks in week view to preload.
  final int preloadWeekViewAmount;

  /// Weeks lines amount in month view.
  final int weeksInMonthViewAmount;

  /// List of points for the week and month
  final List<DateTime>? events;

  /// The first day of the week starts[0-6]
  final int? startWeekDay;

  /// Style of date
  final TextStyle? dateStyle;

  /// Style of Today button
  final TextStyle? todayStyle;

  /// Show DateBox event in container.
  final bool innerDot;

  @override
  _AdvancedCalendarState createState() => _AdvancedCalendarState();
}

class _AdvancedCalendarState extends State<AdvancedCalendar>
    with SingleTickerProviderStateMixin, baseclass {
  late ValueNotifier<int> _monthViewCurrentPage;
  late AnimationController _animationController;
  late AdvancedCalendarController _controller;
  late double _animationValue;
  late List<ViewRange> _monthRangeList;
  late List<List<DateTime>> _weekRangeList;

  PageController? _monthPageController;
  PageController? _weekPageController;
  Offset? _captureOffset;
  DateTime? _todayDate;
  List<String>? _weekNames;
  List<CalendarCircle> calendarCircle = [];

  @override
  void initState() {
    super.initState();

    final monthPageIndex = widget.preloadMonthViewAmount ~/ 2;

    _monthViewCurrentPage = ValueNotifier(monthPageIndex);

    _monthPageController = PageController(
      initialPage: monthPageIndex,
    );

    final weekPageIndex = widget.preloadWeekViewAmount ~/ 2;

    _weekPageController = PageController(
      initialPage: weekPageIndex,
    );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 0,
    );

    _animationValue = _animationController.value;

    _controller = widget.controller ?? AdvancedCalendarController.today();
    _todayDate = _controller.value;

    _monthRangeList = List.generate(
      widget.preloadMonthViewAmount,
      (index) => ViewRange.generateDates(
        _todayDate!,
        _todayDate!.month + (index - _monthPageController!.initialPage),
        widget.weeksInMonthViewAmount,
        startWeekDay: widget.startWeekDay,
      ),
    );

    _weekRangeList = _controller.value.generateWeeks(
      widget.preloadWeekViewAmount,
      startWeekDay: widget.startWeekDay,
    );
    _controller.addListener(() {
      _weekRangeList = _controller.value.generateWeeks(
        widget.preloadWeekViewAmount,
        startWeekDay: widget.startWeekDay,
      );
      _weekPageController!.jumpToPage(widget.preloadWeekViewAmount ~/ 2);
    });
    if (widget.startWeekDay != null && widget.startWeekDay! < 7) {
      final time = _controller.value.subtract(
        Duration(days: _controller.value.weekday - widget.startWeekDay!),
      );
      final list = List<DateTime>.generate(
        8,
        (index) => time.add(Duration(days: index * 1)),
      ).toList();
      _weekNames = List<String>.generate(7, (index) {
        return DateFormat("EEEE").format(list[index]);
      });
    }
    calendarCircle = [
      CalendarCircle(
          textcolor: getColorFromHex(ColorConstants.white),
          outerbordercolor: getColorFromHex(ColorConstants.redcolor),
          buttontext: "No",
          buttoncolor: getColorFromHex(ColorConstants.redcolor),
          buttontitle: "Date to marry"),
      CalendarCircle(
          textcolor: getColorFromHex(ColorConstants.white),
          outerbordercolor: getColorFromHex(ColorConstants.green),
          buttontext: "Yes",
          buttoncolor: getColorFromHex(ColorConstants.green),
          buttontitle: "Date to marry"),
      CalendarCircle(
          textcolor: getColorFromHex(ColorConstants.black),
          outerbordercolor: getColorFromHex(ColorConstants.redpinkishcolor),
          buttontext: "Sartan",
          buttoncolor: getColorFromHex(ColorConstants.white),
          buttontitle: "Burj qamar dar qayam"),
      CalendarCircle(
          textcolor: getColorFromHex(ColorConstants.black),
          outerbordercolor: getColorFromHex(ColorConstants.systembluecolor),
          buttontext: "Jyoshta",
          buttoncolor: getColorFromHex(ColorConstants.white),
          buttontitle: "Nachattar 3"),
      CalendarCircle(
          textcolor: getColorFromHex(ColorConstants.black),
          outerbordercolor: getColorFromHex(ColorConstants.systemorangecolor),
          buttontext: "Saad ",
          buttoncolor: getColorFromHex(ColorConstants.white),
          buttontitle: "Saad & nahas ba aqaid shiyi"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: DefaultTextStyle(
        style: theme.textTheme.bodyText2!,
        child: GestureDetector(
          onVerticalDragStart: (details) {
            _captureOffset = details.globalPosition;
          },
          onVerticalDragUpdate: (details) {
            final moveOffset = details.globalPosition;
            final diffY = moveOffset.dy - _captureOffset!.dy;

            _animationController.value =
                _animationValue + diffY / (widget.weekLineHeight * 5);
          },
          onVerticalDragEnd: (details) => _handleFinishDrag(),
          onVerticalDragCancel: _handleFinishDrag,
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: _monthViewCurrentPage,
                  builder: (_, value, __) {
                    return Header(
                      margin: EdgeInsets.only(
                          left: getW(20), right: getW(20), bottom: getH(20)),
                      monthDate:
                          _monthRangeList[_monthViewCurrentPage.value].firstDay,
                      onPressed: _handleTodayPressed,
                      dateStyle: widget.dateStyle,
                      todayStyle: widget.todayStyle,
                    );
                  },
                ),
                WeekDays(
                  style: theme.textTheme.bodyText1!.copyWith(
                    color: theme.hintColor,
                  ),
                  digit: 2,
                  weekNames: _weekNames != null
                      ? _weekNames!
                      : const <String>['S', 'M', 'T', 'W', 'T', 'F', 'S'],
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (_, __) {
                    final height = Tween<double>(
                      begin: widget.weekLineHeight,
                      end:
                          widget.weekLineHeight * widget.weeksInMonthViewAmount,
                    ).transform(_animationController.value);
                    return Container(
                      margin: EdgeInsets.only(left: getW(20), right: getW(20)),
                      height: height,
                      child: ValueListenableBuilder<DateTime>(
                        valueListenable: _controller,
                        builder: (_, selectedDate, __) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              IgnorePointer(
                                ignoring: _animationController.value == 0.0,
                                child: Opacity(
                                  opacity: Tween<double>(
                                    begin: 0.0,
                                    end: 1.0,
                                  ).evaluate(_animationController),
                                  child: PageView.builder(
                                    onPageChanged: (pageIndex) {
                                      if (widget.onHorizontalDrag != null) {
                                        widget.onHorizontalDrag!(
                                          _monthRangeList[pageIndex].firstDay,
                                        );
                                      }
                                      _monthViewCurrentPage.value = pageIndex;
                                    },
                                    controller: _monthPageController,
                                    physics: _animationController.value == 1.0
                                        ? const AlwaysScrollableScrollPhysics()
                                        : const NeverScrollableScrollPhysics(),
                                    itemCount: _monthRangeList.length,
                                    itemBuilder: (_, pageIndex) {
                                      return MonthView(
                                        innerDot: widget.innerDot,
                                        monthView: _monthRangeList[pageIndex],
                                        todayDate: _todayDate,
                                        selectedDate: selectedDate,
                                        weekLineHeight: widget.weekLineHeight,
                                        weeksAmount:
                                            widget.weeksInMonthViewAmount,
                                        onChanged: _handleDateChanged,
                                        events: widget.events,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              ValueListenableBuilder<int>(
                                valueListenable: _monthViewCurrentPage,
                                builder: (_, pageIndex, __) {
                                  final index = selectedDate.findWeekIndex(
                                    _monthRangeList[_monthViewCurrentPage.value]
                                        .dates,
                                  );
                                  final offset = index /
                                          (widget.weeksInMonthViewAmount - 1) *
                                          2 -
                                      1.0;
                                  return Align(
                                    alignment: Alignment(0.0, offset),
                                    child: IgnorePointer(
                                      ignoring:
                                          _animationController.value == 1.0,
                                      child: Opacity(
                                        opacity: Tween<double>(
                                          begin: 1.0,
                                          end: 0.0,
                                        ).evaluate(_animationController),
                                        child: SizedBox(
                                          height: widget.weekLineHeight,
                                          child: PageView.builder(
                                            onPageChanged: (indexPage) {
                                              final pageIndex =
                                                  _monthRangeList.indexWhere(
                                                (index) =>
                                                    index.firstDay.month ==
                                                    _weekRangeList[indexPage]
                                                        .first
                                                        .month,
                                              );

                                              if (widget.onHorizontalDrag !=
                                                  null) {
                                                widget.onHorizontalDrag!(
                                                  _monthRangeList[pageIndex]
                                                      .firstDay,
                                                );
                                              }
                                              _monthViewCurrentPage.value =
                                                  pageIndex;
                                            },
                                            controller: _weekPageController,
                                            itemCount: _weekRangeList.length,
                                            physics: closeMonthScroll(),
                                            itemBuilder: (context, index) {
                                              return WeekView(
                                                innerDot: widget.innerDot,
                                                dates: _weekRangeList[index],
                                                selectedDate: selectedDate,
                                                lineHeight:
                                                    widget.weekLineHeight,
                                                onChanged:
                                                    _handleWeekDateChanged,
                                                events: widget.events,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.sp),
                        topRight: Radius.circular(15.sp),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                          blurRadius: 12,
                        ),
                      ]),
                  child: Column(
                    children: [
                      HandleBar(
                        onPressed: () async {
                          await _animationController.forward();
                          _animationValue = 1.0;
                        },
                      ),
                      Column(
                        children: List.generate(3, (index) => const eventBox()),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: getW(20),
                            right: getW(20),
                            top: getH(10),
                            bottom: getH(10)),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: getW(170) / getH(75)),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return eventSquareBox(
                              color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                            );
                          },
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: getW(20),
                              right: getW(20),
                              bottom: getH(80)),
                          child: Row(
                            children: List.generate(
                                calendarCircle != null
                                    ? calendarCircle.length
                                    : 0,
                                (index) => CalendarButton(
                                      buttontext:
                                          calendarCircle[index].buttontext,
                                      textcolor:
                                          calendarCircle[index].textcolor,
                                      buttoncolor:
                                          calendarCircle[index].buttoncolor,
                                      outerbordercolor: calendarCircle[index]
                                          .outerbordercolor,
                                      buttontitle:
                                          calendarCircle[index].buttontitle,
                                    )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleWeekDateChanged(DateTime date) {
    _handleDateChanged(date);

    _monthViewCurrentPage.value = _monthRangeList
        .lastIndexWhere((monthRange) => monthRange.dates.contains(date));
  }

  void _handleDateChanged(DateTime date) {
    _controller.value = date;
  }

  void _handleFinishDrag() async {
    _captureOffset = null;

    if (_animationController.value > 0.5) {
      await _animationController.forward();
      _animationValue = 1.0;
    } else {
      await _animationController.reverse();
      _animationValue = 0.0;
    }
  }

  void _handleTodayPressed() {
    _controller.value = DateTime.now().toZeroTime();

    _monthPageController!.jumpToPage(widget.preloadMonthViewAmount ~/ 2);
    _weekPageController!.jumpToPage(widget.preloadWeekViewAmount ~/ 2);
  }

  ScrollPhysics closeMonthScroll() {
    if ((_monthViewCurrentPage.value ==
            (widget.preloadMonthViewAmount ~/ 2) + 3 ||
        _monthViewCurrentPage.value ==
            (widget.preloadMonthViewAmount ~/ 2) - 3)) {
      return const NeverScrollableScrollPhysics();
    } else {
      return const AlwaysScrollableScrollPhysics();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _monthPageController!.dispose();
    _monthViewCurrentPage.dispose();

    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }
}

class CalendarCircle {
  final String? buttontext;
  final Color? outerbordercolor;
  final Color? buttoncolor;
  final Color? textcolor;
  final String? buttontitle;

  CalendarCircle({
    required this.buttontext,
    required this.outerbordercolor,
    required this.buttoncolor,
    required this.textcolor,
    required this.buttontitle,
  });
}
