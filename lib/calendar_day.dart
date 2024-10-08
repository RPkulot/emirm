import 'dart:ffi';

import 'package:calendar_view/calendar_view.dart';
import 'package:eirmuplb/database/user_info_database.dart';
import 'package:eirmuplb/main.dart';
import 'package:eirmuplb/model/insecticidehistory.dart';
import 'package:eirmuplb/reusable_widgets/add_schedule_dialog_widget.dart';
import 'package:eirmuplb/reusable_widgets/day_view_widget.dart';
import 'package:eirmuplb/reusable_widgets/month_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'database/asset_database.dart';
import 'infestation_check_page.dart';
import 'model/event.dart';

final dateToday = DateUtils.dateOnly(DateTime.now());

DateTime get _now => DateTime.now();

class CalendarDayRoute extends StatefulWidget {
  const CalendarDayRoute(@required this.initialDate);
  final int initialDate;
  @override
  _CalendarDayRouteState createState() => _CalendarDayRouteState();
}
class _CalendarDayRouteState extends State<CalendarDayRoute> {

  late List<InsecticideHistoryModel> insecticidehistory;
  late InsecticideHistoryModel currentInsecticide;
  TextEditingController _currentInsecticideController = TextEditingController();
  // TextEditingController _currentInsecticideControllerstartdate = TextEditingController();
  DateTime today = DateTime.now();

  bool isLoading = false;
  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }
  
  @override
  void initState() {
    super.initState();
    refreshCurrent();
    getInsecticideHistory();
  }

  @override
  void dispose() {

    super.dispose();
  }

  Future refreshCurrent() async {
    setState(() => isLoading = true);
    insecticidehistory = await EIRMUserInfoDatabase.instance.insecticideHistory();
    _currentInsecticideController.text = 'NONE';
    await EIRMUserInfoDatabase.instance.deselectInsecticideHistory();
    insecticidehistory.removeWhere((element) => element.usageid == '--------');
    insecticidehistory.removeWhere((element) => element.enddate.isAfter(DateTime.now().add(const Duration(days: 7))));
    insecticidehistory.removeWhere((element) => element.enddate.isBefore(DateTime.now().subtract(const Duration(days: 1))));
    print(DateTime.now());
    print(DateTime.now().subtract(Duration(days: 1)));
    print(insecticidehistory[0].enddate);
    await EIRMUserInfoDatabase.instance.selectCurrentInsecticideHistory(DateTime.parse(DateFormat('yyyy-MM-dd').format(insecticidehistory[0].enddate)).toIso8601String());
    currentInsecticide = await EIRMUserInfoDatabase.instance.currentInsecticideHistory();
    _currentInsecticideController.text = currentInsecticide.insecticideid;
    print(_currentInsecticideController.text);
    setState(() => isLoading = false);
  }

  Future getInsecticideHistory() async {
    setState(() => isLoading = true);

    insecticidehistory = await EIRMUserInfoDatabase.instance.insecticideHistory();
    for (var e in insecticidehistory) {
      final event = CalendarEventData<Event>(
        date: e.startdate,
        color: Color(int.parse(e.color)),
        endTime: DateTime(_now.year,
          _now.month, _now.day, 17),
        startTime: DateTime(_now.year,
            _now.month, _now.day, 8),
        description: 'insecticide schedule',
        endDate: e.enddate,
        // title: _title,
        title: e.insecticideid ,
        event: Event(
          // title: _title,
          title: e.moagroup,
        ),
      );
      CalendarControllerProvider.of<Event>(context).controller.add(event);
    }
    setState(() => isLoading = false);
  }

  final dateNow = DateFormat('MMMMd').format(DateTime.now());
  final weekdayNow = DateFormat('EEEE').format(DateTime.now());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27ae60),
        title: const Text('Pesticide Calendar'),
      ),
      body: DayViewWidget(initialDay: DateTime(DateTime.now().year,DateTime.now().month, widget.initialDate),) ,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Color(0xFF27ae60),
        onPressed: ()
        {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  InfestationCheckPageRoute()));
          // _addEvent();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


