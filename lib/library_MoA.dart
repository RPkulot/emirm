import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:eirmuplb/library_insecticide_subcategory.dart';
import 'package:eirmuplb/main.dart';
import 'package:eirmuplb/model/pesticide.dart';
import 'package:eirmuplb/model/fpalist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'database/asset_database.dart';
import 'image_preview.dart';
import 'library_msds_preview.dart';
import 'library_pest_page.dart';

class LibraryMoARoute extends StatefulWidget {

  @override
  _LibraryMoARouteState createState() =>_LibraryMoARouteState();
}

class _LibraryMoARouteState extends State<LibraryMoARoute>{


  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: NavigationMenuDrawer(),
          appBar: AppBar(
            backgroundColor: Color(0xFF27ae60),
            title: const Text('Mode of Action (MoA)'),
            bottom: const TabBar(
              tabs: [
                Icon(Icons.assessment),
                // Icon(Icons.search),
                Icon(Icons.stacked_bar_chart),
                // Icon(Icons.sanitizer),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Recommended Insecticides for rotation for FAW Management',
                              style:
                              TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        children: [
                          Expanded(
                            child:Text(
                              'Which insecticides are best to use against FAW?',
                              style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          20, 0, 20, 10),
                      child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Each insecticide contains an active ingredient which is responsible in controlling the pest. It is usually indicated in the label. Below presents the recommended active ingredients (Moa group) in insecticides for rotation specific for FAW. It is important to have insecticide rotation using insecticides with different MoA to prevent the development of resistance.',
                                    style:
                                    TextStyle(fontSize: 14,),
                                  ),
                                ],
                              ),
                            ),

                          ]
                      ),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          20, 0, 20, 10),
                      child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/fawmgt1.png')));
                              }, // Image tapped
                              splashColor: Colors.white10, // Splash color over image
                              child: Ink.image(
                                height: MediaQuery.of(context).size.width *.78,
                                width: MediaQuery.of(context).size.width *.8,
                                fit: BoxFit.cover, // Fixes border issues
                                image: const AssetImage(
                                    'assets/images/fawmgt1.png'
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/fawmgt2.png')));
                              }, // Image tapped
                              splashColor: Colors.white10, // Splash color over image
                              child: Ink.image(
                                height: MediaQuery.of(context).size.width *.42,
                                width: MediaQuery.of(context).size.width *.8,
                                fit: BoxFit.cover, // Fixes border issues
                                image: const AssetImage(
                                    'assets/images/fawmgt2.png'
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '*unpublished data produced under the project funded by DOST PCAARRD project entitled: “Insecticide Management and Susceptibility Studies on Fall Armyworm (FAW), Spodoptera frugiperda (J.E. Smith) (Noctuidae, Lepidoptera) (Feb 1, 2020- July 31, 2022) implemented by KPArdez and MVNavasero, NCPC, CAFS, UPLB.',
                                    style:
                                    TextStyle(fontSize: 14,),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '*presented as oral presentations at PMCP 2021 (effective insecticides for FAW)and PMCP 2022 (right frequency of application). ',
                                    style:
                                    TextStyle(fontSize: 14,),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),),
                  ],),
              ),

              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                      child: Row(
                        children: [
                          Text(
                            'Basis of IRM',
                            style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          20, 0, 20, 10),
                      child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Insecticide Resistance',
                                    style:
                                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  20, 0, 20, 10),
                              child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'A heritable change in the sensitivity of a pest population that is reflected in the repeated failure of a product to achieve the expected level of control when used according to the label recommendation for that pest species.',
                                            style:
                                            TextStyle(fontSize: 14,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]
                              ),),
                          ]
                      ),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          20, 0, 20, 10),
                      child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/irmbasis.png')));
                              }, // Image tapped
                              splashColor: Colors.white10, // Splash color over image
                              child: Ink.image(
                                height: MediaQuery.of(context).size.width *.4,
                                width: MediaQuery.of(context).size.width *.8,
                                fit: BoxFit.cover, // Fixes border issues
                                image: const AssetImage(
                                    'assets/images/irmbasis.png'
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Repeated use of pesticides favors the increase of resistant individuals. ',
                                    style:
                                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          20, 0, 20, 20),
                      child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Pesticide Misuse',
                                    style:
                                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'These occurences are generally caused by pesticide misuse through:',
                                    style:
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '1.)',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            'No monitoring prior to control application.',
                                            style:
                                            TextStyle(fontSize: 14,),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '2.)',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            'Poor/no insecticide mode of action (MoA) rotation.',
                                            style:
                                            TextStyle(fontSize: 14,),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '3.)',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            'Failure to follow label instructions and recommended rates.',
                                            style:
                                            TextStyle(fontSize: 14,),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '4.)',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            'COCKTAILING.',
                                            style:
                                            TextStyle(fontSize: 14,),
                                            textAlign: TextAlign.left,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/cocktailing.png')));
                              }, // Image tapped
                              splashColor: Colors.white10, // Splash color over image
                              child: Ink.image(
                                height: MediaQuery.of(context).size.width *.33,
                                width: MediaQuery.of(context).size.width *.8,
                                fit: BoxFit.cover, // Fixes border issues
                                image: const AssetImage(
                                    'assets/images/cocktailing.png'
                                ),
                              ),
                            ),
                          ]
                      ),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          20, 0, 20, 20),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                20, 0, 20, 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'IPM Pyramid',
                                    style:
                                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Based on survey reports from 308 local corn growers, 64% of farmers use chemical control as a primary method of mitigating FAW.',
                                          style:
                                          TextStyle(fontSize: 14,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/ipmpyramid.png')));
                                    }, // Image tapped
                                    splashColor: Colors.white10, // Splash color over image
                                    child: Ink.image(
                                      height: MediaQuery.of(context).size.width *.46,
                                      width: MediaQuery.of(context).size.width *.8,
                                      fit: BoxFit.cover, // Fixes border issues
                                      image: const AssetImage(
                                          'assets/images/ipmpyramid.png'
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        20, 0, 20, 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Integrated Pest Management pyramid + Insecticide Resistance Management delay tactic',
                                          style:
                                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Chemical Control is the last option in pest control:',
                                          style:
                                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '1.) It must be used according to label.',
                                          style:
                                          TextStyle(fontSize: 12,),
                                        ),
                                        Text(
                                          '2.) Insecticide rotation based on mode of action (MoA) must be applied.',
                                          style:
                                          TextStyle(fontSize: 12,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]
                            ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          20, 0, 20, 20),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                20, 0, 20, 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Know the Mode of Action (MoA)',
                                    style:
                                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/modeofactionguide.png')));
                                    }, // Image tapped
                                    splashColor: Colors.white10, // Splash color over image
                                    child: Ink.image(
                                      height: MediaQuery.of(context).size.width *.46,
                                      width: MediaQuery.of(context).size.width *.8,
                                      fit: BoxFit.cover, // Fixes border issues
                                      image: const AssetImage(
                                          'assets/images/modeofactionguide.png'
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/targetsite.png')));
                                    }, // Image tapped
                                    splashColor: Colors.white10, // Splash color over image
                                    child: Ink.image(
                                      height: MediaQuery.of(context).size.width *.55,
                                      width: MediaQuery.of(context).size.width *.8,
                                      fit: BoxFit.cover, // Fixes border issues
                                      image: const AssetImage(
                                          'assets/images/targetsite.png'
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/followlabel.png')));
                                    }, // Image tapped
                                    splashColor: Colors.white10, // Splash color over image
                                    child: Ink.image(
                                      height: MediaQuery.of(context).size.width *.43,
                                      width: MediaQuery.of(context).size.width *.8,
                                      fit: BoxFit.cover, // Fixes border issues
                                      image: const AssetImage(
                                          'assets/images/followlabel.png'
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/moarotation.png')));
                                    }, // Image tapped
                                    splashColor: Colors.white10, // Splash color over image
                                    child: Ink.image(
                                      height: MediaQuery.of(context).size.width *.26,
                                      width: MediaQuery.of(context).size.width *.8,
                                      fit: BoxFit.cover, // Fixes border issues
                                      image: const AssetImage(
                                          'assets/images/moarotation.png'
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/timingandcombination.png')));
                                    }, // Image tapped
                                    splashColor: Colors.white10, // Splash color over image
                                    child: Ink.image(
                                      height: MediaQuery.of(context).size.width *.5,
                                      width: MediaQuery.of(context).size.width *.8,
                                      fit: BoxFit.cover, // Fixes border issues
                                      image: const AssetImage(
                                          'assets/images/timingandcombination.png'
                                      ),
                                    ),
                                  ),
                                ]
                            ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          20, 0, 20, 10),
                      child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/EmirMoA.png')));
                              }, // Image tapped
                              splashColor: Colors.white10, // Splash color over image
                              child: Ink.image(
                                height: MediaQuery.of(context).size.width *.4,
                                width: MediaQuery.of(context).size.width *.8,
                                fit: BoxFit.cover, // Fixes border issues
                                image: const AssetImage(
                                    'assets/images/iracmoatablepic.png'
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Insecticide rotation based on MoA scheme and not on active ingredients and not even brand names. ',
                                    style:
                                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),),
                    const SizedBox(height: 20,),
                  ],),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

