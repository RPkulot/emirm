import 'dart:developer';
import 'package:calendar_view/calendar_view.dart';
import 'package:eirmuplb/database/user_info_database.dart';
import 'package:eirmuplb/infestation_check_page.dart';
import 'package:eirmuplb/library_pest.dart';
import 'package:eirmuplb/surveys.dart';
import 'package:flutter/material.dart';
import 'package:eirmuplb/main.dart';
import 'package:eirmuplb/database/asset_database.dart';

import 'calendar.dart';
import 'model/event.dart';
import 'model/insecticidehistory.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  late List<InsecticideHistoryModel> insecticidehistory;
  late InsecticideHistoryModel currentInsecticide;
  final _currentInsecticideController = TextEditingController();
  bool isLoading = false;
  bool isNewRecord = true;
  int? selectedId;
  bool tablehascontent = false;
  String name = 'a';
  final today = DateTime.now();
  final desiredDate = DateTime.now().add(const Duration(days: 90));

  final TextEditingController _name = TextEditingController();
  final TextEditingController _start_date = TextEditingController();
  final TextEditingController _end_date = TextEditingController();

  // var intervention1 = Intervention(name: 'corn_', moa_group: , chemical_group: , brand: , effectivity_group: , crop: , is_selected: , start_date: , end_date: , created_date: , updated_date: , status: 1);

  @override
  void initState() {
    super.initState();
    isInsecticideHistoryNew();
    getCurrentInsecticide();
    isInsecticideHistoryCompletedBefore();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future isInsecticideHistoryNew() async {
    setState(() => isLoading = true);
    if (await EIRMUserInfoDatabase.instance.tableinsecticidehistoryIsEmpty() == 0) {
      isNewRecord =true;
    } else {
      isNewRecord =false;
    }
    print(isNewRecord);
    return isNewRecord;
    setState(() => isLoading = false);
  }

  Future getCurrentInsecticide() async {
    setState(() => isLoading = true);

    currentInsecticide = await EIRMUserInfoDatabase.instance.currentInsecticideHistory();
    _currentInsecticideController.text = currentInsecticide.insecticideid;
    setState(() => isLoading = false);
  }

  Future isInsecticideHistoryCompletedBefore() async{
    setState(() => isLoading = true);
    final boolreturned = await EIRMUserInfoDatabase.instance.checkFreshInsecticideHistory();
    setState(() => tablehascontent = boolreturned!);

    setState(() => isLoading = false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationMenuDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF27ae60),
        title: const Text('eMIR'),
        // actions: <Widget>[
        //   Padding(
        //       padding: EdgeInsets.only(right: 20.0),
        //       child: GestureDetector(
        //         onTap: () {},
        //         child: Icon(
        //           Icons.search,
        //           size: 26.0,
        //         ),
        //       )
        //   ),
        //   Padding(
        //       padding: EdgeInsets.only(right: 20.0),
        //       child: GestureDetector(
        //         onTap: () {},
        //         child: Icon(
        //             Icons.more_vert
        //         ),
        //       )
        //   ),
        // ],
      ),
        // floatingActionButton: FloatingActionButton(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20),
        //   ),
        //   backgroundColor: Color(0xFF27ae60),
        //   onPressed: ()
        //   {
        //
        //   },
        //   child: Icon(Icons.add),
        // ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  children: [
                    Text(
                      'Farm Activities',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_right_alt,
                        size: 28,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              isNewRecord ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(14)),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Assess for FAW Infestation",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Answer the questions",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfestationCheckPageRoute()));
                          },
                          child: Text(
                            'Get started',
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.white;
                                }
                                return Color(0xFF27ae60);
                              }),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(12)))),
                        ),
                      )
                    ],
                  ),
                ),
              ): SizedBox(
                  height: 0,
              ),
              (isNewRecord==false && _currentInsecticideController.text.isNotEmpty) ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(14)),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Next Insecticide Scheduled:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(_currentInsecticideController.text,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => CalendarRoute()));
                          },
                          child: Text(
                            'Check Status',
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.white;
                                }
                                return Color(0xFF27ae60);
                              }),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(12)))),
                        ),
                      )
                    ],
                  ),
                ),
              ) : SizedBox(height: 0,),
              (isNewRecord==false && _currentInsecticideController.text.isEmpty) ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(14)),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "FAW control successful",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Congratulations!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    InfestationCheckPageRoute()));
                          },
                          child: Text(
                            'Update FAW Status',
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.white;
                                }
                                return Color(0xFF27ae60);
                              }),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(12)))),
                        ),
                      )
                    ],
                  ),
                ),
              ):SizedBox(height: 0,),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  children: [
                    Text(
                      'Research News',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_right_alt,
                        size: 28,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(14)),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Recorded Crop Protection Practices of Corn Farmers in Luzon, Visayas and Mindanao for FAW control.",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => SurveysRoute()));
                          },
                          child: Text(
                            'Learn More',
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.white;
                                }
                                return Color(0xFF27ae60);
                              }),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(12)))),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
