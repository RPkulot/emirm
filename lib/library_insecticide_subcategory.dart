import 'dart:convert';

import 'package:eirmuplb/main.dart';
import 'package:eirmuplb/model/fpalist.dart';
import 'package:flutter/material.dart';

import 'database/asset_database.dart';
import 'library_insecticide_search.dart';
import 'library_pest_page.dart';

const List<String> listMoaGroup = <String>['5', '6', '13', '14','15', '16', '17', '18','23', '28', '29', '-','11A', '12A', '15+3A', '16+1A','1A', '1A+1B', '1B', '1B+3A','20A', '22A', '28+4A', '28+9B','2B', '3A', '3A+4A', '4A','4A+1A', '4A+3A', '4C', '4E','7C', '9B', 'CONTACT', 'SYSTEMIC','UN', 'UNF'];

class LibraryInsecticideSubcategoryRoute extends StatefulWidget {

  const LibraryInsecticideSubcategoryRoute( @required this.moagroup);
  final moagroup;
  
  @override

  _LibraryInsecticideSubcategoryRouteState createState() =>_LibraryInsecticideSubcategoryRouteState();
}

class _LibraryInsecticideSubcategoryRouteState extends State<LibraryInsecticideSubcategoryRoute>{
  late String keyword = '';

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        drawer: NavigationMenuDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xFF27ae60),
          title: Text('Insecticides (MOA: ${widget.moagroup})'),
        ),
        body:
        SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder<List<FPAListModel>>(
                  future: EIRMAssetDatabase.instance.searchFPAList(keyword, widget.moagroup),
                  builder: (context, AsyncSnapshot<List<FPAListModel>> snapshot) {
                    if (snapshot.hasError) print('error: ${snapshot.error}');
                    var data = snapshot.data;
                    return snapshot.hasData ? FPAPesticidesList(data!, widget.moagroup) : new Center(child: Text('No pesticide that include this keyword'),);
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

