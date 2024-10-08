import 'dart:async';
import 'dart:io';

import 'package:eirmuplb/library_msds_preview.dart';
import 'package:eirmuplb/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'library_pest_page.dart';
final Uri _url = Uri.parse('https://www.grainger.com/know-how/safety/safety-communications/hazardous-communications-ghs/kh-safety-comparing-chemical-labeling-systems-198-qt');
//TODO: convert the url launcher to an iOS friendly version, check package pub page
class LibraryMsdsRoute extends StatefulWidget {
  @override
  _LibraryMsdsRouteState createState() => _LibraryMsdsRouteState();
}

class _LibraryMsdsRouteState extends State<LibraryMsdsRoute> {
  String chlorantriniprolePDF = "";
  String chlorfenapyrPDF = "";
  String chlorfluazuronPDF = "";
  String cyantraniliprolePDF = "";
  String diatomaceousPDF = "";
  String emamectinPDF = "";
  String indoxacarbPDF = "";
  String lufenuronPDF = "";
  String matrinePDF = "";
  String spinetoramPDF = "";
  String tetraniliprolePDF = "";
  String thiamethoxamPDF = "";
  @override
  void initState() {
    super.initState();
    fromAsset('assets/pdfs/Chlorantraniliprole.pdf', 'Chlorantraniliprole.pdf').then((f) {
      setState(() {
        chlorantriniprolePDF = f.path;
      });
    });
    fromAsset('assets/pdfs/Chlorfenapyr.pdf', 'Chlorfenapyr.pdf').then((f) {
      setState(() {
        chlorfenapyrPDF = f.path;
      });
    });
    fromAsset('assets/pdfs/Chlorfluazuron.pdf', 'Chlorfluazuron.pdf').then((f) {
      setState(() {
        chlorfluazuronPDF = f.path;
      });
    });
    fromAsset('assets/pdfs/Cyantraniliprole.pdf', 'Cyantraniliprole.pdf').then((f) {
      setState(() {
        cyantraniliprolePDF = f.path;
      });
    });
    fromAsset('assets/pdfs/Diatomaceous.pdf', 'Diatomaceous.pdf').then((f) {
      setState(() {
        diatomaceousPDF = f.path;
      });
    });
    fromAsset('assets/pdfs/Emamectin.pdf', 'Emamectin.pdf').then((f) {
      setState(() {
        emamectinPDF = f.path;
      });
    });
    fromAsset('assets/pdfs/Indoxacarb.pdf', 'Indoxacarb.pdf').then((f) {
      setState(() {
        indoxacarbPDF = f.path;
      });
    });
    fromAsset('assets/pdfs/Lufenuron.pdf', 'Lufenuron.pdf').then((f) {
      setState(() {
        lufenuronPDF = f.path;
      });
    });
    fromAsset('assets/pdfs/Matrine.pdf', 'Matrine.pdf').then((f) {
      setState(() {
        matrinePDF = f.path;
      });
    });
    fromAsset('assets/pdfs/Spinetoram.pdf', 'Spinetoram.pdf').then((f) {
      setState(() {
        spinetoramPDF = f.path;
      });
    });
    fromAsset('assets/pdfs/Tetraniliprole.pdf', 'Tetraniliprole.pdf').then((f) {
      setState(() {
        tetraniliprolePDF = f.path;
      });
    });
    fromAsset('assets/pdfs/Thiamethoxam.pdf', 'Thiamethoxam.pdf').then((f) {
      setState(() {
        thiamethoxamPDF = f.path;
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
  late String keyword = '';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: NavigationMenuDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xFF27ae60),
          title: const Text('MSDS Library'),
          bottom: const TabBar(
            tabs: [
              Text('SDS Basics', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              // Icon(Icons.assessment),
              Text('SDS List', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              // Icon(Icons.search),
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
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'What is a Safety Data Sheet (SDS)?',
                            style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                                  '1.) An SDS (formerly known as MSDS) includes information such as the properties of each chemical; the physical, health, and environmental health hazards; protective measures; and safety precautions for handling, storing, and transporting the chemical.',
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
                              children: [
                                Text(
                                  '2.) It provides guidance for each specific chemical on things such as:',
                                  style:
                                  TextStyle(fontSize: 14,),
                                ),
                                Text(
                                  '${' ' * 5}•Personal Protective Equipment (PPE)',
                                  style:
                                  TextStyle(fontSize: 14,),
                                ),
                                Text(
                                  '${' ' * 5}•First aid procedures',
                                  style:
                                  TextStyle(fontSize: 14,),
                                ),
                                Text(
                                  '${' ' * 5}•Spill clean-up procedures',
                                  style:
                                  TextStyle(fontSize: 14,),
                                ),
                                //(n.d.). Safety Data Sheets. The University of Iowa. Retrieved March 30, 2023, from https://ehs.research.uiowa.edu/chemical/safety-data-sheets-sdss
                              ],
                            ),
                          ),
                        ]
                    ),),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Who needs to have SDSs?',
                            style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                                  'Laboratories, facilities or shops that use chemicals must obtain an SDS that is specific to each chemical used in the workplace.',
                                  style:
                                  TextStyle(fontSize: 14,),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'The list of Safety Datasheets of our recommended insecticides can be accessed by swiping to the right of this screen.',
                                  style:
                                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ]
                    ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 35, 20, 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '(n.d.). Safety Data Sheets. The University of Iowa. Retrieved March 30, 2023, from https://ehs.research.uiowa.edu/chemical/safety-data-sheets-sdss',
                            style:
                            TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Chemical Labeling Systems',
                            style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                                  'There are multiple standards for warning symbols in chemical labels.',
                                  style:
                                  TextStyle(fontSize: 14,),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                InkWell(
                                  onTap: _launchUrl,
                                  child: Text(
                                    'Click here to view the major label warning systems (Requires an internet connection)',
                                    style:
                                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                    ),),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Basic Fist Aid for Chemical Incidents ',
                            style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                                  'Commence the following First Aid and, as soon as practicable, contact the nearest .',
                                  style:
                                  TextStyle(fontSize: 14,),
                                ),
                                Text(
                                  'DO NOT use any other lotion or medication to treat chemical contacts/injuries ',
                                  style:
                                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                                  'Skin Contact:',
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
                                          'Drench the affected area with clean running water for at least 10 minutes and until no chemical remains in contact with the skin. ',
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
                                          'Remove contaminated clothing, which is not stuck to the skin, as soon as practicable after commencement of washing. ',
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
                                          'If there is any injury cover with clean, non-fluffy material to protect from infection and, or if skin absorption is suspected, transfer casualty to hospital. ',
                                          style:
                                          TextStyle(fontSize: 14,),
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //(n.d.). Safety Data Sheets. The University of Iowa. Retrieved March 30, 2023, from https://ehs.research.uiowa.edu/chemical/safety-data-sheets-sdss
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Eye Contact:',
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
                                          ' Flush the eye with clean running water for at least 10 minutes.',
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
                                          'Obtain medical examination of the affected eye.',
                                          style:
                                          TextStyle(fontSize: 14,),
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //(n.d.). Safety Data Sheets. The University of Iowa. Retrieved March 30, 2023, from https://ehs.research.uiowa.edu/chemical/safety-data-sheets-sdss
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ingestion:',
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
                                          'Do not make the casualty vomit.',
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
                                          'Wash out the mouth with water.',
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
                                          'Give 1 pint (500 ml) of water to drink. ',
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
                                          'Transfer casualty to hospital.',
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Inhalation:',
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
                                          'Remove the casualty from exposure.',
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
                                          'Rest and keep warm.',
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
                                          ' If the casualty has been seriously affected obtain medical attention.',
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
                        ]
                    ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 35, 20, 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '(2010, January 5). First Aid for Chemical Contacts. Birmingham.ac.uk. Retrieved March 30, 2023, from https://intranet.birmingham.ac.uk/hr/documents/public/hsu/information/hazardoussubstances/chem9.pdf',
                            style:
                            TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],),
            ),
            SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         border: OutlineInputBorder(), labelText: 'keyword'),
                  //     onChanged: (value) {
                  //       keyword = value;
                  //       setState(() {
                  //
                  //       });
                  //     },
                  //   ),
                  // ),
                  Column(
                    children: <Widget>[
                      ListView(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        children: [
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Chlorantraniliprole"),
                            onTap: () {
                              if (chlorantriniprolePDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(chlorantriniprolePDF),
                                  ),
                                );
                              }
                            }, ),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Chlorfenapyr"),
                            onTap: () {
                              if (chlorfenapyrPDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(chlorfenapyrPDF),
                                  ),
                                );
                              }
                            }, ),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Chlorfluazuron"),
                            onTap: () {
                              if (chlorfluazuronPDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(chlorfluazuronPDF),
                                  ),
                                );
                              }
                            }, ),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Cyantraniliprole"),
                            onTap: () {
                              if (cyantraniliprolePDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(cyantraniliprolePDF),
                                  ),
                                );
                              }
                            }, ),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Diatomaceous"),
                            onTap: () {
                              if (diatomaceousPDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(diatomaceousPDF),
                                  ),
                                );
                              }
                            }, ),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Emamectin"),
                            onTap: () {
                              if (emamectinPDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(emamectinPDF),
                                  ),
                                );
                              }
                            }, ),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Indoxacarb"),
                            onTap: () {
                              if (indoxacarbPDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(indoxacarbPDF),
                                  ),
                                );
                              }
                            }, ),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Lufenuron"),
                            onTap: () {
                              if (lufenuronPDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(lufenuronPDF),
                                  ),
                                );
                              }
                            }, ),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Matrine"),
                            onTap: () {
                              if (matrinePDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(matrinePDF),
                                  ),
                                );
                              }
                            }, ),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Spinetoram"),
                            onTap: () {
                              if (spinetoramPDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(spinetoramPDF),
                                  ),
                                );
                              }
                            }, ),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Tetraniliprole"),
                            onTap: () {
                              if (tetraniliprolePDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(tetraniliprolePDF),
                                  ),
                                );
                              }
                            }, ),
                          ListTile(
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                            title: Text("Thiamethoxam"),
                            onTap: () {
                              if (thiamethoxamPDF.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LibraryMsdsPreviewRoute(thiamethoxamPDF),
                                  ),
                                );
                              }
                            }, ),
                        ],
                      ),
                    ],
                  ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: pdfList.length,
                  //   itemBuilder: (context, index) {
                  //     return ListTile(
                  //       onTap: () {
                  //         if (pathPDF.isNotEmpty) {
                  //           Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //               builder: (context) => LibraryMsdsPreviewRoute(path),
                  //             ),
                  //           );
                  //         }
                  //       },
                  //     );
                  //   },
                  // )
                ],
              ),
            ),
          ),
          ]
        ),
      ),
    );
  }
}
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

