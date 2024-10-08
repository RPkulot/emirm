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

const List<String> listMoaGroup = <String>['5', '6', '13', '14','15', '16', '17', '18','23', '28', '29', '-','11A', '12A', '15+3A', '16+1A','1A', '1A+1B', '1B', '1B+3A','20A', '22A', '28+4A', '28+9B','2B', '3A', '3A+4A', '4A','4A+1A', '4A+3A', '4C', '4E','7C', '9B', 'CONTACT', 'SYSTEMIC','UN', 'UNF'];

class LibraryInsecticideRoute extends StatefulWidget {

  @override

  _LibraryInsecticideRouteState createState() =>_LibraryInsecticideRouteState();
}

class _LibraryInsecticideRouteState extends State<LibraryInsecticideRoute>{
  String fpabannedrestrictedlistPDF = "";
    late String keyword = '';
  @override
  void initState() {
    super.initState();
    fromAsset('assets/pdfs/fpabannedrestrictedlist.pdf', 'fpabannedrestrictedlist.pdf')
        .then((f) {
      setState(() {
        fpabannedrestrictedlistPDF = f.path;
      });
    });
  }
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
        length: 4,
        child: Scaffold(
          drawer: NavigationMenuDrawer(),
          appBar: AppBar(
            backgroundColor: Color(0xFF27ae60),
            title: const Text('Insecticides'),
            bottom: const TabBar(
              tabs: [
                Icon(Icons.assessment),
                Icon(Icons.search),
                Icon(Icons.stacked_bar_chart),
                Icon(Icons.sanitizer),
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
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(), labelText: 'keyword'),
                                onChanged: (value) {
                                  keyword = value;
                                  setState(() {

                                  });
                                },
                              ),
                            ),
                            SingleChildScrollView(
                              physics: ScrollPhysics(),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(border: Border.all(),),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                          child: Container(
                                            decoration: BoxDecoration(border: Border.all(),),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (fpabannedrestrictedlistPDF.isNotEmpty) {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => LibraryMsdsPreviewRoute(fpabannedrestrictedlistPDF),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Text(
                                                      'Click here to view the List of banned/restricted insecticides',
                                                      style:
                                                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              physics: ScrollPhysics(),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Insecticide Category by MOA group:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: listMoaGroup.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        key: Key('${listMoaGroup[index]}'),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF27ae60),
                                                  borderRadius: BorderRadius.circular(5)),
                                              width: MediaQuery.of(context).size.width,
                                              height: 50,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF27ae60)),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(builder: (context) => LibraryInsecticideSubcategoryRoute(listMoaGroup[index])));
                                                },
                                                child: Text(
                                                  ' ${listMoaGroup[index]} ',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              )),
                                        ),
                                        // },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
                                    MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/iracmoatablepic.png')));
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
                            'Insecticide Resistance Results',
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
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Sixteen (16) formulated insecticides were tested in the laboratory to determine if the registered recommended rate is still effective against FAW based on the EFFECTIVE DOSE TO RECOMMENDED RATE RATIO (ED:RR). An insecticide with ED:RR of less than or equal to 1.0 is considered without resistance.',
                                    style:
                                    TextStyle(fontSize: 14,),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'The list below includes some of the active ingredients that tested weak or with resistance against FAW in the laboratory.',
                                    style:
                                    TextStyle(fontSize: 14,),
                                  ),
                                ],
                              ),
                            ),
                            DataTable(
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Expanded(
                                    child: Text(
                                      'Active Ingredient',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Text(
                                      'MoA',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Text(
                                      'ED:RR',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                              ],
                              rows: const <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Carbosulfan')),
                                    DataCell(Text('1A')),
                                    DataCell(Text('3.49')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Lambdacyhalothrin')),
                                    DataCell(Text('3A')),
                                    DataCell(Text('791.62')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Bacillus thuringiensis')),
                                    DataCell(Text('11A')),
                                    DataCell(Text('25.95')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Indoxacarb-S')),
                                    DataCell(Text('2A')),
                                    DataCell(Text('1.16')),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'On the other hand, the list below are some of the active ingredients that conferred no resistance against FAW in the laboratory.',
                                    style:
                                    TextStyle(fontSize: 14,),
                                  ),
                                ],
                              ),
                            ),
                            DataTable(
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Expanded(
                                    child: Text(
                                      'Active Ingredient',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Text(
                                      'MoA',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Text(
                                      'ED:RR',
                                      style: TextStyle(fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                              ],
                              rows: const <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Indoxacarb-A')),
                                    DataCell(Text('22A')),
                                    DataCell(Text('0.1267')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Tetraniliprole')),
                                    DataCell(Text('28')),
                                    DataCell(Text('0.0046')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Chlorfluazuron')),
                                    DataCell(Text('15')),
                                    DataCell(Text('0.0003')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Cyantraniliprole')),
                                    DataCell(Text('28')),
                                    DataCell(Text('0.0076')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Spinosad')),
                                    DataCell(Text('5')),
                                    DataCell(Text('0.0854')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Chlorantraniliprole + Thiamethoxam')),
                                    DataCell(Text('28 + 4A')),
                                    DataCell(Text('0.0058')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Emamectin benzoate')),
                                    DataCell(Text('6')),
                                    DataCell(Text('< 0.0001')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Pyridalyl')),
                                    DataCell(Text('UN')),
                                    DataCell(Text('0.0147')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Spinetoram')),
                                    DataCell(Text('5')),
                                    DataCell(Text('< 0.0001')),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Lambdacyhalothrin')),
                                    DataCell(Text('3A')),
                                    DataCell(Text('791.62')),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'The recommended rates of the insecticides with the active ingredients above are more than enough to kill half the FAW population.',
                                    style:
                                    TextStyle(fontSize: 14,),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),),
                    SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(border: Border.all(),),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'The action of the insecticide, whether it is slow- or fast-acting, can be determined using susceptibility assay in the laboratory. As presented in the figures, fast acting insecticides have overlapping response curves from 24 Hours after Treatment (HAT) and 48 HAT, while slow-acting insecticides do not overlap.',
                                          style:
                                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
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
                                    'Guide notes: (1) Slow acting insecticides caused considerable mortality occurred 48 hours after treatment (see figures a, d, e, f, g,h,j, l and m) while fast acting caused considerable mortality 24 hours after treatment (see figures b, c, l and k); (2) ED-RR ratio value of greater than 1 means occurence of insecticide resistance.',
                                    style:
                                    TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                      child: Row(
                        children: [
                          Text(
                            'I. With Insecticide Resistance(a-d)',
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
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/indoxacarbs-a.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/indoxacarbs-a.png'
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/lamdacyhalothrin-b.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/lamdacyhalothrin-b.png'
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/carbosulfan-c.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/carbosulfan-c.png'
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/bthuringiensis-d.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/bthuringiensis-d.png'
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Figure 1. ED (effective dose) – RR (recommended rate) ratio and response curve of FAW  among insecticides with resistance to: (a) Indoxacarb-S (MoA 22A); (b)Lamdacyhalothrin-K (MoA 3A); (c) Carbosulfan-M (MoA 1A); and (d) Bacillus thuringiensis (MoA 11A) and categorize either slow-acting or fast acting insecticide.',
                                    style:
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                      child: Row(
                        children: [
                          Text(
                            'II. With No Insecticide Resistance(e-m)',
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
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/indoxacarba-e.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/indoxacarba-e.png'
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/tetraniliprole-f.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/tetraniliprole-f.png'
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/clorflauzuron-g.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/clorflauzuron-g.png'
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/cyantraniliprole-h.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/cyantraniliprole-h.png'
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/spinosad-i.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/spinosad-i.png'
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/chlorantraniliprolethiamethoxam-j.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/chlorantraniliprolethiamethoxam-j.png'
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/emamectinbenzoate-k.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.35,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/emamectinbenzoate-k.png'
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/pyridalyl-l.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.35,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/pyridalyl-l.png'
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/spinetoram-m.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.35,
                                    width: MediaQuery.of(context).size.width *.7,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/spinetoram-m.png'
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Figure 2. ED (effective dose) – RR (recommended rate) ratio and response curve of FAW  among insecticides with no resistance to: (e) Indoxacarb- A (MoA 22A); (f) Tetraniliprole (MoA 28); (g) Clorfluazuron (MoA 15); (h) Cyantraniliprole (MoA 28); (i) Spinosad (MoA 5); (j) Chlorantraniliprole + Thiamethoxam  (MoA 28+4A);  (k) Emamectin Benzoate (MoA 6);  (l) Pyridalyl(MoA UN); and (m) Spinetoram (MoA 5) .',
                                    style:
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                      child: Row(
                        children: [
                          Text(
                            'III. Response of different geographic \npopulations of FAW',
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
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/carbosulfan-sus.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/carbosulfan-sus.png'
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/cyantraniliprole-sus.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/cyantraniliprole-sus.png'
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/bthuringiensis-sus.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/bthuringiensis-sus.png'
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/spinosad-sus.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/spinosad-sus.png'
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/indoxacarbs-sus.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/indoxacarbs-sus.png'
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/pyridalyl-sus.png')));
                                  }, // Image tapped
                                  splashColor: Colors.white10, // Splash color over image
                                  child: Ink.image(
                                    height: MediaQuery.of(context).size.width *.350,
                                    width: MediaQuery.of(context).size.width *.35,
                                    fit: BoxFit.cover, // Fixes border issues
                                    image: const AssetImage(
                                        'assets/images/pyridalyl-sus.png'
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Figure 3. ED (effective dose) – RR (recommended rate) ratio and response curve of different FAW  populations among the following nsecticides: (n) Carbosulfan (MoA1A);  (o) Bacillus thuringiensis (MoA 11A) ; (p) Indoxacarb-S (MoA 22A);  (q) Cyantraniliprole (MoA 28); (r)Spinosad (MoA 5); and (s) Pyridalyl (MoA UN). ',
                                    style:
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),),
                  ],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

