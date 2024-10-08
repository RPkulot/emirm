import 'dart:developer';
import 'package:eirmuplb/calendar.dart';
import 'package:eirmuplb/reusable_widgets/add_schedule_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:eirmuplb/main.dart';
import 'package:eirmuplb/database/asset_database.dart';

import 'model/insecticidehistory.dart';

import 'package:eirmuplb/model/pesticide.dart';
import 'package:flutter/material.dart';

class InfestationCheckPageRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationMenuDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF27ae60),
        title: const Text('E-IRM'),
        // actions: <Widget>[ElevatedButton( onPressed: () async {
        //   // await EIRMDatabase.instance.dropTimelineTable();
        //   var timeline1 = TimeLineModel(name: name, start_date: DateTime.now(), end_date: desiredDate , is_done: false, created_date: DateTime.now(), updated_date: DateTime.now());
        //   name = name + 'a';
        //   await EIRMDatabase.instance.insertTimeline(timeline1);
        //   await EIRMDatabase.instance.rawQuery();
        //   print (today);
        //   print (desiredDate);
        // }, child: Text('add dummy'))],
      ),

      /// 5. make a how to use the app portion at the bottom
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                20, 20, 20, 0),
            child: Row(
              children: [
                Text('FAW Management',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                IconButton(onPressed: () {},
                  icon: const Icon(Icons.arrow_right_alt, size: 28,),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              width: 300,
              decoration: BoxDecoration(color: Colors.green[200],
                  borderRadius: BorderRadius.circular(14)),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Assess for FAW Infestation", style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Suriin ang taniman sa presensya ng harabas at siguraduhin kung ang taniman ay umabot sa dalawampung porsyentong pinsala ng harabas.", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => AddScheduleDialogWidget()));
                      },
                      child: Text('Get started',
                        style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((
                              states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.white;
                            }
                            return Color(0xFF27ae60);
                          }),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius
                                  .circular(12)))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
