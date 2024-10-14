import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'calendar.dart';
import 'database/myfarm_db.dart';
import 'database/user_info_database.dart';
import 'model/insecticidehistory.dart';
import 'model/myfarm.dart';
import 'my_farm_edit.dart';

class MyFarmDetailPage extends StatefulWidget {
  final int farmId;

  const MyFarmDetailPage({
    Key? key,
    required this.farmId,
  }) : super(key: key);

  @override
  State<MyFarmDetailPage> createState() => _MyFarmDetailPageState();
}

class _MyFarmDetailPageState extends State<MyFarmDetailPage> {
 late Farm farm;
  late List<InsecticideHistoryModel> insecticidehistory;
  late InsecticideHistoryModel currentInsecticide;
  final _currentInsecticideController = TextEditingController();
  bool isLoading = false;
  bool isNewRecord = true;
  int? selectedId;
  bool tablehascontent = false;


  @override
  void initState() {
    super.initState();
    getCurrentInsecticide();
    refreshFarm();
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
  Future refreshFarm() async {
    setState(() => isLoading = true);

    farm = await MyFarmDatabase.instance.viewFarm(widget.farmId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xFF27ae60),
      actions: [editButton(), deleteButton()],
    ),
    body: isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          Center(
            child: Text(
              farm.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),

          const SizedBox(height: 20),
          Text('Date planted : ', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 20),),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(DateFormat.yMMMd().format(farm.createdTime), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
          ),
          const SizedBox(height: 20),
          Text('Description : ', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 20),),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              farm.description,
              style:
              const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),

      SizedBox(height: 20,),
            Text('Current Insecticide: ', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text( _currentInsecticideController.text,
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 40,
          ),

          Text('Insecticide History : ', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 20),),
           SizedBox(height: 40,),

          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CalendarRoute()));
            }, child: Container(decoration: BoxDecoration(color: Colors.green),
            child: Text('<< Proceed >>'),),),
        ],
      ),

    ),

  );

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNotePage(farm: farm),
        ));

        refreshFarm();
      });

  Widget deleteButton() => IconButton(
    icon: const Icon(Icons.delete),
    onPressed: () async {
      await MyFarmDatabase.instance.delete(widget.farmId);

      Navigator.of(context).pop();
    },
  );
}


















// late List<InsecticideHistoryModel> insecticidehistory;
// late InsecticideHistoryModel currentInsecticide;
//
// bool isNewRecord = true;
//
// bool tablehascontent = false;
// final TextEditingController _currentInsecticideController =
// TextEditingController();












//
//




