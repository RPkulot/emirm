import 'dart:ffi';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:eirmuplb/database/user_info_database.dart';
import 'package:eirmuplb/main.dart';
import 'package:eirmuplb/model/insecticidehistory.dart';
import 'package:eirmuplb/reusable_widgets/add_schedule_dialog_widget.dart';
import 'package:eirmuplb/reusable_widgets/month_view_widget.dart';
import 'package:eirmuplb/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'infestation_check_page.dart';
import 'model/event.dart';

final dateToday = DateUtils.dateOnly(DateTime.now());

DateTime get _now => DateTime.now();

class CalendarRoute extends StatefulWidget {
  const CalendarRoute({
    Key? key,
  }) : super(key: key);
  @override
  _CalendarRouteState createState() => _CalendarRouteState();
}
class _CalendarRouteState extends State<CalendarRoute> {

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
      drawer: NavigationMenuDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF27ae60),
        title: const Text('Pesticide Calendar'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueGrey[900]),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Upcoming Insecticide to use:',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _currentInsecticideController.text,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                '$weekdayNow, $dateNow',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height * .75,
                height: 490,
                child: MonthViewWidget(),
              ),
              // Container(
              //   color: Color(0xFF27ae60),
              //   child: TableCalendar(
              //     selectedDayPredicate: (day)=> isSameDay(day, today),
              //     focusedDay: today,
              //     firstDay: DateTime.utc(2020, 1, 1),
              //     lastDay: DateTime.utc(2050, 1, 1),
              //     rangeStartDay: today,
              //     rangeEndDay: DateTime.now().add(
              //         const Duration(days: 14)),
              //     onDaySelected: _onDaySelected,
              //   ),
              // ),
              // Container(
              //   child: ElevatedButton(
              //     onPressed: () async {
              //       await NotificationService.showNotification(
              //         title: "Scheduled FAW Action",
              //         body: "Assess for the severity of FAW infestation. Please assess the effect of insecticides used.                                                                                                                                                                                                                                                                                                                                             ",
              //         payload: {
              //           "navigate": "true",
              //         },
              //         actionButtons: [
              //           NotificationActionButton(
              //             key: 'check',
              //             label: 'Check it out',
              //             actionType: ActionType.SilentAction,
              //             color: Colors.green,
              //           )
              //         ],
              //         schedule: DateTime.now(),
              //       );
              //     },
              //     child: Text('Click for Instructions (notif for now)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              //   ),
              // ),
              // Container(
              //   child: ElevatedButton(
              //     onPressed: () async {
              //       await EIRMUserInfoDatabase.instance.deleteinsecticidehistory();
              //       // print(counting);
              //       await EIRMUserInfoDatabase.instance.rawQuery();
              //     },
              //     child: Text('delete table of insecticide history', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
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
  // Future<void> _addEvent() async {
  //   // void pop([dynamic value]) => Navigator.of(this).pop(value);
  //   final event = await Navigator.of(context).push(MaterialPageRoute<CalendarEventData<Event>>(builder: (context) => AddScheduleDialogWidget()));
  //
  //   // final event = await context.pushRoute<CalendarEventData<Event>>(AddTimelineDialogWidget(),);
  //   print(event);
  //   if (event == null) return;
  //   CalendarControllerProvider.of<Event>(context).controller.add(event);
  // }
}


