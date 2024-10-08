import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:eirmuplb/database/asset_database.dart';
import 'package:eirmuplb/database/user_info_database.dart';
import 'package:eirmuplb/model/insecticidehistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import '../calendar.dart';
import '../services/notification_service.dart';

DateTime get _now => DateTime.now();

class AddScheduleDialogWidget extends StatefulWidget {
  // final void Function(CalendarEventData<Event>)? onEventAdd;

  // const AddTimelineDialogWidget( @required this.onEventAdd);

  @override
  _AddScheduleDialogWidgetState createState() => _AddScheduleDialogWidgetState();
}

class _AddScheduleDialogWidgetState extends State<AddScheduleDialogWidget> {
  int currentStep = 0;
  bool isCompleted = false;
  // final _form = GlobalKey<FormState>();
  List<GlobalKey<FormState>> _form = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];
  late List<InsecticideHistoryModel> insecticidehistory;
  late InsecticideHistoryModel lastdaterecord;
  DateTime lastdate = DateTime.now();
  late List<String> namesoflistofunusableInsecticides = ['kek'];
  late List<String> moagroupsoflistofunusableinsecticides = ['bruh'];
  bool isLoading = false;
  String name = '';
  String insecticide = '';
  String moagroup = '';
  String moagrouping = '';
  late DateTime parsedStartDate;
  late DateTime parsedEndDate;
  Color _color = Color(0xFF27ae60);
  late ValueChanged<String> onChangedName;
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _insecticide = TextEditingController();
  TextEditingController _moagroup = TextEditingController();
  TextEditingController _moagrouping = TextEditingController();

  final list1 = [
    {'name': 'Spinetoram', 'moagroup': '5', 'moagrouping': 'MOA5'},
    {'name': 'Emamectin Benzoate', 'moagroup': '6', 'moagrouping': 'MOA6'},
    {'name': 'Tetraniliprole', 'moagroup': '28', 'moagrouping': 'MOA28'},
    {'name': 'Cyantraniliprole', 'moagroup': '28', 'moagrouping': 'MOA28'},
    {'name': 'Chlorantraniliprole + Thiamethoxan', 'moagroup': '28', 'moagrouping': 'MOA28'}
  ];
  final list2 =[
    {'name': 'Matrine', 'moagroup': 'UC', 'moagrouping': 'MOAUC'},
    {'name': 'Chlorfluazuron', 'moagroup': '15', 'moagrouping': 'MOA15'},
    {'name': 'Lufenuron', 'moagroup': '13', 'moagrouping': 'MOA13'},
    {'name': 'Chlorfenapyr', 'moagroup': '13', 'moagrouping': 'MOA13'},
    {'name': 'Indoxacarb', 'moagroup': '22A', 'moagrouping': 'MOA22A'},
    {'name': 'Pyridalyl', 'moagroup': 'UC', 'moagrouping': 'MOAUC'}
  ];
  final list3 = [
    {'name': 'Diatomaceous earth', 'moagroup': 'UC', 'moagrouping': 'MOAUC'},
    {'name': 'Matrines + S. flavescens extract', 'moagroup': 'UC', 'moagrouping': 'MOAUC'}
  ];

  @override
  void initState() {
    super.initState();
    refreshTables();
  }

  @override
  void dispose() {

    super.dispose();
  }

  Future refreshTables() async {
    setState(() => isLoading = true);

    insecticidehistory = (await EIRMUserInfoDatabase.instance.insecticideHistory());
    // var sampleData = insecticidehistory.map((e) => {date: e.startdate}) as CalendarEventData;
    // print(insecticidehistory);
    // print(insecticidehistorymap);
    if (insecticidehistory.isNotEmpty) {
      insecticidehistory.sort((a, b) => a.enddate.compareTo(b.enddate));
      setState(
          () => lastdaterecord = insecticidehistory[insecticidehistory.length - 1]);
      print('the last date is:');
      print(lastdaterecord.enddate);
        lastdate = lastdaterecord.enddate;
        print(lastdate);
    }
    print(DateTime.now());
    insecticidehistory.removeWhere((element) => element.enddate.isBefore(DateTime.now().subtract(const Duration(days: 28))));
    insecticidehistory.removeWhere((element) => element.moagroup == 'MOAUC');
    var insecticidehistorymapreduced = insecticidehistory.map((e){
      return {
        "usageid": e.usageid,
        "insecticideid": e.insecticideid,
        "startdate": e.startdate,
        "enddate": e.enddate,
        "color": e.color,
        "is_current": e.is_current,
        "moagroup": e.moagroup
      };
    }).toList();
    print(insecticidehistorymapreduced);
    if (insecticidehistory.isNotEmpty) {
      setState(() => namesoflistofunusableInsecticides =
          insecticidehistory.map((e) => e.insecticideid).toList());
      setState(() => moagroupsoflistofunusableinsecticides =
          insecticidehistory.map((e) => e.moagroup).toList());
      print(namesoflistofunusableInsecticides);
    }

    setState(() => isLoading = false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-IRM'),backgroundColor: Color(0xFF27ae60),
      ),
      body: Stepper(
        steps: getSteps(),
        type: StepperType.horizontal,
        currentStep: currentStep,
        onStepTapped: (step) {
          _form[currentStep].currentState!.validate(); //this will trigger validation
          setState(() {
            currentStep = step;
          });
        },
        onStepContinue: () {
          final isLastStep = currentStep == getSteps().length - 1;
          _form[currentStep].currentState!.validate();
          bool isDetailValid = isDetailComplete(); //this check if ok to move on to next screen

          if (isDetailValid) {
            if (isLastStep) {
              setState(() {
                isCompleted = true;
              });
            } else {
              setState(() {
                currentStep += 1;

              });
            }
          }
        },
        onStepCancel: () {
          if (currentStep == 0) {
            Navigator.pop(context);
          } else {
            setState(() {
              currentStep -= 1;
            });
          }
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          final isLastStep = currentStep == getSteps().length - 1;
          return Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              children: [
                if (currentStep <= 1)
                  Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.white;
                          }
                          return Color(0xFF27ae60);
                        }
                        ),),
                        onPressed: details.onStepContinue,
                        child: Text(isLastStep ? "CONFIRM" : "NEXT"),
                      )
                  ),
                if (currentStep <= 1)
                  SizedBox(width: 12,),
                if (currentStep != 0)
                  Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.white;
                          }
                          return Color(0xFF27ae60);
                          }
                        ),),
                        onPressed: details.onStepCancel,
                        child: Text("Back"),
                      )
                  )
              ],
            )
          );
        },
      ),
    );
  }

  bool isDetailComplete() {
    if (currentStep == 0) {
      if (insecticidehistory.isNotEmpty){
        if (namesoflistofunusableInsecticides.contains(insecticide)) {
          return false;
        }
        if (moagroupsoflistofunusableinsecticides.contains(moagrouping)) {
          return false;
        }
      }
      if (_insecticide.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (currentStep == 1) {
      if (insecticidehistory.isNotEmpty){
        if ((parsedStartDate).isBefore(lastdate) == true){
          return false;
        }
      }
      if (_startDateController.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  List<Step> getSteps() => [
    Step(
        title: const Text('Insecticide'),
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        content: SingleChildScrollView(
          child: Form(
            key: _form[0],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Instructions:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '1. Click on any item to show options under their effectiveness',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '2. Those with the same MoA (except UC) cannot be used consecutively within a month',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.greenAccent),
                      child: ExpansionTile(
                        title: Text('Excellent', style: TextStyle(color: Colors.green),),
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.grey),
                            child:
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: list1.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    onTap: ()  {
                                      setState(() {
                                        name = list1[index]['name'].toString();
                                        insecticide = list1[index]['name'].toString();
                                        _insecticide.text = insecticide;
                                        moagroup = list1[index]['moagroup'].toString();
                                        _moagroup.text = moagroup;
                                        moagrouping = list1[index]['moagrouping'].toString();
                                        _moagrouping.text = moagrouping;
                                      });
                                    },
                                  // leading: Icon(Icons.local_pharmacy, size: 40,),
                                  title: Text(list1[index]['name'].toString() + ' (MoA: ' + list1[index]['moagroup'].toString() +')'),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.yellow),
                      child: ExpansionTile(
                        title: Text('Good', style: TextStyle(color: Colors.orange),),
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.grey),
                            child:
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: list2.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: ()  {
                                    setState(() {
                                      name = list2[index]['name'].toString();
                                      insecticide = list2[index]['name'].toString();
                                      _insecticide.text = insecticide;
                                      moagroup = list2[index]['moagroup'].toString();
                                      _moagroup.text = moagroup;
                                      moagrouping = list2[index]['moagrouping'].toString();
                                      _moagrouping.text = moagrouping;
                                    });
                                  },
                                  // leading: Icon(Icons.local_pharmacy, size: 40,),
                                  title: Text(list2[index]['name'].toString() + ' (MoA: ' + list2[index]['moagroup'].toString() +')'),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.orange),
                      child: ExpansionTile(
                        title: Text('Fair', style: TextStyle(color: Colors.red),),
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.grey),
                            child:
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: list3.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: ()  {
                                    setState(() {
                                      name = list3[index]['name'].toString();
                                      insecticide = list3[index]['name'].toString();
                                      _insecticide.text = insecticide;
                                      moagroup = list3[index]['moagroup'].toString();
                                      _moagroup.text = moagroup;
                                      moagrouping = list3[index]['moagrouping'].toString();
                                      _moagrouping.text = moagrouping;
                                    });
                                  },
                                  // leading: Icon(Icons.local_pharmacy, size: 40,),
                                  title: Text(list3[index]['name'].toString() + ' MoA: ' + list3[index]['moagroup'].toString() +')'),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(labelText: 'Current Insecticide Option'),
                  controller: _insecticide,
                  validator: (value) {
                    if (namesoflistofunusableInsecticides.contains(value) == true){
                      return "The selected must not be recently used";
                    }
                    if (value == null || value.isEmpty) {
                      return "*Required";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(labelText: 'MoA of selection'),
                  controller: _moagrouping,
                  validator: (value) {
                    if (moagroupsoflistofunusableinsecticides.contains(value) == true){
                      return "Must not be of the same MoA as recent.";
                    }
                    if (value == null || value.isEmpty) {
                      return "*Required";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
    ),
    Step(
        title: const Text('Schedule'),
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        content: Form(
          key: _form[1],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Spray Interval:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Excellent - Three weeks at the vegetative stage and two weeks at the reproductive stage',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Good - 1 to 2 weeks at the vegetative stage and two weeks at the reproductive stage',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Fair - weekly at the vegetative stage and two weeks at the reproductive stage',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      readOnly: true,
                      controller: _startDateController,
                      validator: (value) {
                        if (DateTime.parse(value!).compareTo(lastdate) < 0){
                          return "Schedule can only be added after the last entry.";
                        }
                        if (value == null || value.isEmpty) {
                          return "*Required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        icon: Icon(Icons.calendar_today_rounded),
                        labelText: 'Select Start Date',
                      ),
                      onTap: () async{
                        DateTime? _startDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2050));
                        if (_startDate != null) {
                          setState(() {
                            _startDateController.text = DateFormat('yyyy-MM-dd').format(_startDate);
                            print(_startDate);
                            parsedStartDate = DateTime.parse(_startDateController.text);
                            print(parsedStartDate);
                          });
                        }
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(10.0),
                  //   child: TextFormField(
                  //     readOnly: true,
                  //     controller: _endDateController,
                  //     validator: (value) {
                  //       if (_endDateController.text.compareTo(_startDateController.text) < 0){
                  //         return "End date must be later than start date";
                  //       }
                  //       if (value == null || value.isEmpty) {
                  //         return "*Required";
                  //       }
                  //       return null;
                  //     },
                  //     decoration: InputDecoration(
                  //       border: UnderlineInputBorder(),
                  //       icon: Icon(Icons.calendar_today_rounded),
                  //       labelText: 'Select End Date',
                  //     ),
                  //     onTap: () async{
                  //       DateTime? _endDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2050));
                  //       if (_endDate != null) {
                  //         setState(() {
                  //           _endDateController.text = DateFormat('yyyy-MM-dd').format(_endDate);
                  //           parsedEndDate = DateTime.parse(_endDateController.text);
                  //           print(_endDate);
                  //           print(parsedEndDate);
                  //         });
                  //       }
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Select Color: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        GestureDetector(
                          onTap: _displayColorPicker,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: _color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    ),
    Step(
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 2,
      title: const Text('Complete'),
      content: Form(
        key: _form[2],
        child: Column(
          children: [
            Text('Information Complete!'),
            SizedBox(height: 30,),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF27ae60)),
                      ),
                      // onPressed: () {},
                      onPressed: () async {
                        var colorString = '0x' + _color.value.toRadixString(16);
                        print (colorString);
                        // await EIRMAssetDatabase.instance.deselectInsecticideHistory();
                        var insecticidehistoryToAdd = InsecticideHistoryModel(usageid: _moagrouping.text, insecticideid: _insecticide.text, startdate: parsedStartDate, enddate: parsedStartDate, color: colorString, is_current: false, moagroup: _moagrouping.text);
                        await EIRMUserInfoDatabase.instance.insertInsecticideHistory(insecticidehistoryToAdd);
                        await NotificationService.showNotification(
                          title: "Scheduled FAW Action",
                          body: "Assess for the severity of FAW infestation.",
                          payload: {
                            "navigate": "true",
                          },
                          // actionButtons: [
                          //   NotificationActionButton(
                          //     key: 'check',
                          //     label: 'Check it out',
                          //     actionType: ActionType.SilentAction,
                          //     color: Colors.green,
                          //   )
                          // ],
                          schedule: parsedStartDate.add(Duration(days: 6)),
                        );
                        var insecticidehistoryblocker = InsecticideHistoryModel(usageid: '--------', insecticideid: '--------', startdate: parsedStartDate.add(Duration(days: 1)), enddate: parsedStartDate.add(Duration(days: 6)), color: '0xff75857c', is_current: false, moagroup: 'filler');
                        await EIRMUserInfoDatabase.instance.insertInsecticideHistory(insecticidehistoryblocker);
                        print('kek');
                        await EIRMUserInfoDatabase.instance.rawQuery();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => CalendarRoute()));
                      },
                      child: Text('Save'),
                    ),
                  ),
                ],
              ),),],
        ),
      ),
    )
  ];

  void _displayColorPicker() {
    var color = _color;
    showDialog(
      context: context,
      useSafeArea: true,
      barrierColor: Colors.black26,
      builder: (_) => SimpleDialog(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: Color(0xffdddee9),
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.all(20.0),
        children: [
          Text(
            "Event Color",
            style: TextStyle(
              color: Color(0xffdddee9),
              fontSize: 25.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 1.0,
            color: Color(0xffdddee9),
          ),
          ColorPicker(
            displayThumbColor: true,
            enableAlpha: false,
            pickerColor: _color,
            onColorChanged: (c) {
              color = c;
            },
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 30.0),
              child: GestureDetector(
                onTap: () {
                  if (mounted)
                    setState(() {
                      _color = color;
                    });
                  print(_color.value.toRadixString(16));
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 40,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff6471e9),
                    borderRadius: BorderRadius.circular(7.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 4),
                        blurRadius: 10,
                        spreadRadius: -3,
                      )
                    ],
                  ),
                  child: Text(
                    'Select',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}