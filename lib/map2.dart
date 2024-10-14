import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:eirmuplb/map.dart';
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

class HistoricalDistribution extends StatefulWidget {
  const HistoricalDistribution({Key? key}) : super(key: key);
  @override
  _HistoricalDistributionState createState() => _HistoricalDistributionState();
}

class _HistoricalDistributionState extends State<HistoricalDistribution> {
  late List<MapDataModel> mapdata;

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
    const LatLng(15.1122, 120.6836),
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



  loadData() async {
    mapdata = await EIRMAssetDatabase.instance.mapdata();
    mapdata.removeWhere((element) => element.long.isEmpty);
    mapdata.removeWhere((element) => element.lat.isEmpty);

    for (int i = 0; i < mapdata.length; i++) {
      final Uint8List markerIcon =
      await getBytesFromAsset("assets/images/circle-24.png", 10);

      _markers.add(
        Marker(
            markerId: MarkerId((i + 15).toString()),
            position: LatLng(
              double.parse(
                mapdata[i].lat.replaceAll(RegExp("[ \n\t\r\f]"), ''),
              ),
              double.parse(
                mapdata[i].long.replaceAll(RegExp("[ \n\t\r\f]"), ''),
              ),
            ),
            icon: BitmapDescriptor.fromBytes(markerIcon),
            onTap: () {}

        ),
      );

      setState(() {});
    }
  }
bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: const NavigationMenuDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF27ae60),
        title: const Text('Historical Datapoints'),
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
      ),
      body: Stack(children: [
        GoogleMap(
          onTap: (position) {},
          onCameraMove: (position) {},
          onMapCreated: (GoogleMapController controller) async {},
          markers: Set<Marker>.of(_markers),
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 5.0,
          ),
        ),

        ExpansionTile(
          title: const Text(
            'HISTORICAL DISTRIBUTION',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            'AS OF 2020',
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
              SizedBox(width: 5,),
              Expanded(child: Text('MAP LEGEND', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),),
            ],),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/images/circle-24.png',
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
                    "Positive Infestation: no ongoing study yet",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    // widget.data!.date!,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
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
          itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<String>>[
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
}
