import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';

class DayViewWidget extends StatelessWidget {
  final GlobalKey<DayViewState>? state;
  final double? width;
  final DateTime initialDay;

  const DayViewWidget({
    Key? key,
    this.state,
    this.width,
    required this.initialDay
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DayView<Event>(
      initialDay: initialDay,
      key: state,
      width: width,
    );
  }
}