import 'dart:core';

import 'package:calendar_view/calendar_view.dart';
import 'package:eirmuplb/calendar_day.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';

class MonthViewWidget extends StatelessWidget {
  final GlobalKey<MonthViewState>? state;
  final double? width;

  const MonthViewWidget({
    Key? key,
    this.state,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MonthView<Event>(
      onCellTap: (events, date) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalendarDayRoute(date.day)));
      },
      cellAspectRatio: 0.75,
      startDay: WeekDays.sunday,
      key: state,
      width: width,
    );
  }
}
