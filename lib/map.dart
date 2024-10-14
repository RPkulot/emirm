import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:eirmuplb/map2.dart';
import 'package:eirmuplb/map3.dart';
import 'package:eirmuplb/model/mapdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';

import 'database/asset_database.dart';

import 'main.dart';
import 'src/locations.dart' as locations;

class MapRoute extends StatefulWidget {
  const MapRoute({Key? key}) : super(key: key);
  @override
  _MapRouteState createState() => _MapRouteState();
}

class _MapRouteState extends State<MapRoute> {
  late List<MapDataModel> mapdata;
  late List<LatLng> _latLangfromdb;

  // CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  final Completer<GoogleMapController> _controller = Completer();

  List<String> images = [
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png'
  ];
  List<String> circle = [
    'assets/images/circle-outline-24.png',
    'assets/images/circle-outline-24.png',
    'assets/images/circle-outline-24.png',
    'assets/images/circle-outline-24.png',
    'assets/images/circle-outline-24.png',
    'assets/images/circle-outline-24.png',
    'assets/images/circle-outline-24.png',
    'assets/images/circle-outline-24.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png'
  ];
  List<String> cross = [
    'assets/images/x-mark-24.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png',
    'assets/images/pin.png'
  ];

  late GoogleMapController mapController;
  bool isLoading = false;
  Uint8List? markerImage;
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLang = <LatLng>[
    const LatLng(6.3916, 124.92),
    const LatLng(15.0693, 120.7374),
    const LatLng(15.862345, 120.577509),
    const LatLng(10.6096, 123.745),
    const LatLng(6.46297, 124.878727),
    const LatLng(14.165342, 121.241932),
    const LatLng(15.0677, 120.7316),
    const LatLng(15.8707, 120.5806),
    const LatLng(9.6122, 123.8143),
    const LatLng(15.8851, 120.5843),
    const LatLng(13.8874, 121.4770),
    const LatLng(17.1166, 121.8776),
    const LatLng(17.4295, 121.8227),
    const LatLng(18.2914, 122.0332),
    const LatLng(15.1122, 120.6836)
  ];
  final List<String> _good = <String>[
    'Currently researching',
    'Cyantraniliprole, Spinosad, Indoxacarb, Pyridalyl',
    'Currently researching',
    'Currently researching',
    'Currently researching',
    'Currently researching',
    'Cyantraniliprole, Spinosad, Indoxacarb, Pyridalyl',
    'Currently researching',
    'Currently researching',
    'Currently researching',
    'Currently researching',
    'Currently researching',
    'Currently researching',
    'Cyantraniliprole, Spinosad, Indoxacarb, Pyridalyl',
    'Cyantraniliprole, Spinosad, Indoxacarb, Pyridalyl'
  ];
  final List<String> _bad = <String>[
    'Currently researching',
    'Carbosulfan, B. thuringiensis var. aizawai',
    'Currently researching',
    'Currently researching',
    'Currently researching',
    'Currently researching',
    'Carbosulfan, B. thuringiensis var. aizawai',
    'Currently researching',
    'Currently researching',
    'Currently researching',
    'Currently researching',
    'Carbosulfan, Indoxacarb',
    'Currently researching',
    'Carbosulfan, B. thuringiensis var. aizawai',
    'Carbosulfan, B. thuringiensis var. aizawai'
  ];
  final List<String> _markerAddress = <String>[
    'Bololmala Tupi, South Cotabato \n9505',
    'San Pablo Sta. Ana, Pampanga 2022',
    'Santo Domingo Sto. Tomas, \nPangasinan 2020',
    'Tubigagmanok Asturias, Cebu 6042',
    'Carpenter Hill, Purok Pag-Asa \nKoronadal City, South Cotabato 9506',
    'Batong Malaki Los Banos, Laguna  \n4031',
    'Brgy. San Pablo, Sta. Ana,  Pampanga',
    'Brgy. San Antonio, Santo Tomas, \nPangasinan',
    'Brgy. Tinago, Dauis, Bohol',
    'Brgy. Poblacion East, Sto. Tomas, \nPangasinan',
    'Brgy. Montecillo Sariaya, Quezon',
    'Brgy. San Felipe Ilagan, Isabela',
    'Barangay Tapel Gonzaga, Cagayan',
    'Brgy. Pangatlan, Mexico, Pampanga',
  ];

  final LatLng _center = const LatLng(14.165342, 121.241932);

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void dispose() {
    // _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadData();
    // getMapData();
  }

  // Future getMapData() async {
  //   setState(() => isLoading = true);
  //
  //   mapdata = await EIRMAssetDatabase.instance.mapdata();
  //   // print(mapdata);
  //   mapdata.removeWhere((element) => element.long.isEmpty);
  //   mapdata.removeWhere((element) => element.lat.isEmpty);
  //
  //   setState(() => isLoading = false);
  // }

  loadData() async {
    for (int i = 0; i < _markerAddress.length; i++) {
      print('address' + _markerAddress[i].toString());
      final Uint8List markerIcon =
      await getBytesFromAsset("assets/images/pin.png", 40);
      // print(_latLang[3]);
      _markers.add(
        Marker(
            markerId: MarkerId(i.toString()),
            position: _latLang[i],
            icon: BitmapDescriptor.fromBytes(markerIcon),
            onTap: () {
              // _customInfoWindowController.addInfoWindow!(
              _showBottomSheet(context, i);
              // Container(
              //   width: 240,
              //   height: (_good[i]
              //       .toString()
              //       .length > 0 ||
              //       _bad[i]
              //           .toString()
              //           .length > 0)
              //       ? 130
              //       : 60,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border.all(color: Colors.grey),
              //     borderRadius: BorderRadius.circular(10.0),
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       // Text(
              //       //   _markerAddress[i].toString(),
              //       //   style:
              //       //   TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              //       //   // widget.data!.date!,
              //       // ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       _good[i]
              //           .toString()
              //           .length > 0\
              //           ? Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           ClipOval(
              //             child: Image.asset(
              //               'assets/images/checkmark-24.png',
              //               width: 35,
              //               height: 35,
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //           SizedBox(
              //             width: 5,
              //           ),
              //           Expanded(
              //             child: Text(
              //               _good[i].toString(),
              //               style: TextStyle(
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.bold),
              //               // widget.data!.date!,
              //             ),
              //           ),
              //         ],
              //       )
              //           : SizedBox(
              //         height: 0,
              //       ),
              //
              //       SizedBox(
              //         height: 10,
              //       ),
              //       _bad[i]
              //           .toString()
              //           .length > 0
              //           ? Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           ClipOval(
              //             child: Image.asset(
              //               'assets/images/x-mark-24.png',
              //               width: 35,
              //               height: 35,
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //           SizedBox(
              //             width: 5,
              //           ),
              //           Expanded(
              //             child: Text(
              //               _bad[i].toString(),
              //               style: TextStyle(
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.bold),
              //               // widget.data!.date!,
              //             ),
              //           ),
              //         ],
              //       )
              //           : SizedBox(
              //         height: 0,
              //       ),
              //       // Text(
              //       //   _markertexts[i],
              //       //   maxLines: 2,
              //       //
              //       // ),
              //     ],
              //   ),
              // );
              // _latLang[i],
              // );
            }),
      );

      setState(() {});
    }
    mapdata = await EIRMAssetDatabase.instance.mapdata();
//     // print(mapdata);
//     mapdata.removeWhere((element) => element.long.isEmpty);
//     mapdata.removeWhere((element) => element.lat.isEmpty);
//
//     for (int i = 0; i < mapdata.length; i++) {
//       // print('address'+_markerAddress[i].toString());
//       final Uint8List markerIcon =
//           await getBytesFromAsset("assets/images/circle-24.png", 10);
//       // print(_latLang[3]);
//       _markers.add(
//         Marker(
//             markerId: MarkerId((i + 15).toString()),
//             position: LatLng(
//               double.parse(
//                 mapdata[i].lat.replaceAll(RegExp("[ \n\t\r\f]"), ''),
//               ),
//               double.parse(
//                 mapdata[i].long.replaceAll(RegExp("[ \n\t\r\f]"), ''),
//               ),
//             ),
//             icon: BitmapDescriptor.fromBytes(markerIcon),
//             onTap: () {
// //===========
// //
// //
// //             _customInfoWindowController.addInfoWindow!(
// //               Container(
// //                 width: 240,
// //                 height: 130,
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   border: Border.all(color: Colors.grey),
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //                 child:
// //                 Column(
// //                   mainAxisAlignment: MainAxisAlignment.start,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       mapdata[i].municity.toString(),
// //                       style:
// //                       TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
// //                       // widget.data!.date!,
// //                     ),
// //                     SizedBox(height: 10,),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.start,
// //                       children: [
// //                         ClipOval(
// //                           child: Image.asset(
// //                             'assets/images/checkmark-24.png',
// //                             width: 35,
// //                             height: 35,
// //                             fit: BoxFit.cover,
// //                           ),
// //                         ),
// //
// //                         SizedBox(width: 5,),
// //                         Expanded(
// //                           child: Text(
// //                             'Currently researching',
// //                             style:
// //                             TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
// //                             // widget.data!.date!,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //
// //                     SizedBox(height: 10,),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.start,
// //                       children: [
// //                         ClipOval(
// //                           child: Image.asset(
// //                             'assets/images/x-mark-24.png',
// //                             width: 35,
// //                             height: 35,
// //                             fit: BoxFit.cover,
// //                           ),
// //                         ),
// //                         SizedBox(width: 5,),
// //                         Expanded(
// //                           child: Text(
// //                             'Currently researching',
// //                             style:
// //                             TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
// //                             // widget.data!.date!,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     // Text(
// //                     //   _markertexts[i],
// //                     //   maxLines: 2,
// //                     //
// //                     // ),
// //
// //                   ],
// //                 ),
// //               ),
// //               LatLng(double.parse(mapdata[i].lat.replaceAll(RegExp("[ \n\t\r\f]"), '')), double.parse(mapdata[i].long.replaceAll(RegExp("[ \n\t\r\f]"), ''))),
// //             );
// //
// //
// //
// //
// //
// //
// //
//             }
//             // =========
//             ),
//       );
//
//       setState(() {});
//     }
  }
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: const NavigationMenuDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF27ae60),
        title: const Text('Site Locations'),
        actions: [
          Row(
            children: [
              FlutterSwitch(
                activeText: "FAW",
                inactiveText: "OAW",
                width: 70,
                height: 40,
                valueFontSize: 12,
                toggleSize: 30,
                showOnOff: true,
                activeColor: Colors.yellow.shade700,
                inactiveColor: Colors.deepPurple,
                activeIcon: Image.asset('assets/images/corn (1).png'),
                inactiveIcon: Image.asset('assets/images/onion1 (1).png'),
                value: status,
                onToggle: (value) {
                  setState(() {
                    status = value;
                  });
                },
              ),
            ],
          )
        ],
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
      body: Stack(children: [
        GoogleMap(
          onTap: (position) {
            // _customInfoWindowController.hideInfoWindow!();
          },
          onCameraMove: (position) {
            // _customInfoWindowController.onCameraMove!();
          },
          onMapCreated: (GoogleMapController controller) async {
            // _customInfoWindowController.googleMapController = controller;
          },
          markers: Set<Marker>.of(_markers),
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 5.0,
          ),
        ),
        // CustomInfoWindow(
        //   controller: _customInfoWindowController,
        //   height: 130,
        //   width: 240,
        //   offset: 35,
        // ),

        ExpansionTile(
          title: const Text(
            'SUSCEPTIBILITY DATA',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // widget.data!.date!,
          ),
          subtitle: const Text(
            'Baseline Susceptibility studies of commercially available insecticides for FAW',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // widget.data!.date!,
          ),
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     ClipOval(
                //       child: Image.asset(
                //         'assets/images/circle-24.png',
                //         width: 22,
                //         height: 22,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  child: Text(
                    "MAP LEGEND",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    // widget.data!.date!,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 5,
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/images/pin.png',
                    width: 22,
                    height: 22,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  child: Text(
                    "Positive Infestation with ongoing research",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    // widget.data!.date!,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 35,
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/images/checkmark-24.png',
                    width: 22,
                    height: 22,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  child: Text(
                    "With no Insecticide Resistance",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    // widget.data!.date!,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 35,
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/images/x-mark-24.png',
                    width: 22,
                    height: 22,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  child: Text(
                    'With Insecticide Resistance',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    // widget.data!.date!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),),
        child: PopupMenuButton<String>(
          icon: Icon(Icons.menu, color: Colors.black, size: 30),
          onSelected: (value) {
            switch (value) {
              case 'option1':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapRoute(),),);
                break;
              case 'option2':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoricalDistribution(),),);
                break;
              case 'option3':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PotentialDistributionMap(),),);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'option1',
              child: Text('Susceptibility Baseline'),
            ),
            PopupMenuItem<String>(
              value: 'option2',
              child: Text('Historical Datapoint Distribution'),
            ),
            PopupMenuItem<String>(
              value: 'option3',
              child: Text('FAW Potential Distribution'),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _markerAddress[index],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _good[index].toString().isNotEmpty
                      ? SingleChildScrollView(
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/checkmark-24.png',
                            width: 35,
                            height: 35,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            _good[index].toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      : const SizedBox(height: 0),
                  const SizedBox(height: 10),
                  _bad[index].toString().isNotEmpty
                      ? Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/x-mark-24.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          _bad[index].toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                      : const SizedBox(height: 0),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
