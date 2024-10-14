import 'dart:developer';
import 'package:calendar_view/calendar_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eirmuplb/database/user_info_database.dart';
import 'package:eirmuplb/infestation_check_page.dart';
import 'package:eirmuplb/library_pest.dart';
import 'package:eirmuplb/surveys.dart';
import 'package:flutter/material.dart';
import 'package:eirmuplb/main.dart';
import 'package:eirmuplb/database/asset_database.dart';
import 'package:intl/intl.dart';
import 'calendar.dart';
import 'database/myfarm_db.dart';
import 'library_insecticide.dart';
import 'model/event.dart';
import 'model/insecticidehistory.dart';
import 'model/myfarm.dart';
import 'my_farm_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  late List<Farm> farm;
  Farm? farms;
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
  final _dateTime = DateTime.now().subtract(const Duration(days: 1));

  get dropdownDemographicValue => null;

  // var intervention1 = Intervention(name: 'corn_', moa_group: , chemical_group: , brand: , effectivity_group: , crop: , is_selected: , start_date: , end_date: , created_date: , updated_date: , status: 1);

  @override
  void initState() {
    super.initState();
    refreshFarms();
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
    if (await EIRMUserInfoDatabase.instance.tableinsecticidehistoryIsEmpty() ==
        0) {
      isNewRecord = true;
    } else {
      isNewRecord = false;
    }
    print(isNewRecord);
    return isNewRecord;
    setState(() => isLoading = false);
  }

  Future getCurrentInsecticide() async {
    setState(() => isLoading = true);

    currentInsecticide =
        await EIRMUserInfoDatabase.instance.currentInsecticideHistory();
    _currentInsecticideController.text = currentInsecticide.insecticideid;
    setState(() => isLoading = false);
  }

  Future isInsecticideHistoryCompletedBefore() async {
    setState(() => isLoading = true);
    final boolreturned =
        await EIRMUserInfoDatabase.instance.checkFreshInsecticideHistory();
    setState(() => tablehascontent = boolreturned!);

    setState(() => isLoading = false);
  }

  Future refreshFarms() async {
    setState(() => isLoading = true);

    farms = (await MyFarmDatabase.instance.allFarm()) as Farm;

    setState(() => isLoading = false);
  }
  // // Retrieve and display farm data from the SQLite database
  // Future<List<FarmData>> getFarmData() async {
  //   final db = await DatabaseHelper.instance.database;
  //   final maps = await db.query('farmData');
  //   return List.generate(maps.length, (i) {
  //     return FarmData(
  //       maps[i]["dateOfMedicineSprayed"],
  //       maps[i]["dateOfMonitoringDone"],
  //       maps[i]["dateOfPlantation"],
  //     );
  //   });
  // }
  //
  // // Retrieve and display access history from the SQLite database
  // Future<List<AccessHistory>> getAccessHistory() async {
  //   final db = await DatabaseHelper.instance.database;
  //   final maps = await db.query('accessHistory');
  //   return List.generate(maps.length, (i) {
  //     return AccessHistory(
  //       DateTime.parse(maps[i]['timestamp']),
  //       maps[i]['action'],
  //     );
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationMenuDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF27ae60),
        title: const Text(
          'eMIR'
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 250.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.green[800]!, Colors.green[200]!],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 2,
                          ),
                          height: 200.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.green[800]!, Colors.green[200]!],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text(
                                'Farm1',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                              Divider(
                                thickness: 2,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat('dd/MM')
                                            .format(DateTime.now()),
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                      Text(
                                        DateFormat('EEE')
                                            .format(DateTime.now()),
                                        style: TextStyle(
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Sprayed',
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '09 ',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 40.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'days \n ago',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green[300],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40.0),
                                    topRight: Radius.circular(40.0),
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    'Monitored ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(
                                    timeago.format(_dateTime),
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green[300],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40.0),
                                    topRight: Radius.circular(40.0),
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    'Planted ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(
                                    DateFormat('dd/MM').format(DateTime.now()),
                                    style: TextStyle(fontSize: 12.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.green[800]!, Colors.green[200]!],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.favorite, color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                children: [
                  const Text(
                    'Photographic info.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.health_and_safety,
                      size: 28,
                    ),
                  )
                ],
              ),
            ),
            CarouselSlider(
              items: [
                Expanded(
                  child: Image.asset('assets/images/timingandcombination.png'),
                ),
                Expanded(
                  child: Image.asset('assets/images/targetsite.png'),
                ),
                Expanded(
                  child: Image.asset('assets/images/moarotation.png'),
                ),
                Expanded(
                  child: Image.asset('assets/images/modeofactionguide.png'),
                ),
              ],
              options: CarouselOptions(
                height: 300,
                aspectRatio: 16 / 9,
                viewportFraction: 0.6,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {},
                scrollDirection: Axis.horizontal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                children: [
                  const Text(
                    'Usage History',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.reorder_rounded,
                      size: 28,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.science),
                      title: const Text(
                        'Previous insecticide',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      subtitle: const Text(
                        'August 05, 2023',
                        style: TextStyle(
                            fontSize: 10, fontStyle: FontStyle.italic),
                      ),
                      tileColor: Colors.green[100],
                    ),
                    ListTile(
                      leading: const Icon(Icons.science),
                      title: const Text('XXxxxxxXXXxxxXXXxXX'),
                      tileColor: Colors.green[200],
                    ),
                    ListTile(
                      leading: const Icon(Icons.science),
                      title: const Text('XXXXXXXXXxXXxXxXXXXXX'),
                      tileColor: Colors.green[300],
                    ),
                    ListTile(
                      leading: const Icon(Icons.science),
                      title: Text('XXxxxxxXXXXXXXXxxXXXX'),
                      tileColor: Colors.green[400],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isNewRecord
          ? FloatingActionButton(
              backgroundColor: Colors.green[200],
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyFarmPage(),
                ));
              },
              child: Tooltip(
                message: 'Monitor Farm',
                child: Image.asset(
                  'assets/images/Emir_farm.png',
                  height: 80,
                  width: 70,
                ),
              ),
            )
          : (isNewRecord == false &&
                  _currentInsecticideController.text.isNotEmpty)
              ? FloatingActionButton(
                  backgroundColor: Colors.green[200],
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CalendarRoute(),
                      ),
                    );
                  },
                  child: Tooltip(
                    message: 'Monitor Farm',
                    child: Image.asset(
                      'assets/images/Emir_farm.png',
                      height: 80,
                      width: 70,
                    ),
                  ),
                )
              : (isNewRecord == false &&
                      _currentInsecticideController.text.isEmpty)
                  ? FloatingActionButton(
                      backgroundColor: Colors.green[200],
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CalendarRoute(),
                          ),
                        );
                      },
                      child: Tooltip(
                        message: 'Monitor Farm',
                        child: Image.asset('assets/images/Emir_farm.png'),
                      ),
                    )
                  : const SizedBox(height: 0),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF27ae60),
        shape: CircularNotchedRectangle(),
        child: SizedBox(
          height: 60.0, // Set the desired height for the BottomAppBar
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    tooltip: 'User Profile',
                    icon: const Icon(
                      Icons.person_pin,
                      size: 30.0,
                      semanticLabel: 'Profile',
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const Scaffold(
                            body: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      left: 20,
                                      right: 20,
                                      bottom: 0),
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 50.0,
                                      child: Icon(
                                        Icons.person,
                                        size: 40.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'FARMER',
                                  style: TextStyle(letterSpacing: 2.5),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: ListTile(
                                    leading: Text('Name:'),
                                    title: Text('Juan'),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                IconButton(
                  tooltip: 'Insecticide',
                  icon: const Icon(Icons.local_drink),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LibraryInsecticideRoute(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
