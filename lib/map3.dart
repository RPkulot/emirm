import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'map.dart';
import 'map2.dart';

class PotentialDistributionMap extends StatefulWidget {
  const PotentialDistributionMap({Key? key}) : super(key: key);
  @override
  _PotentialDistributionMapState createState() =>
      _PotentialDistributionMapState();
}

class _PotentialDistributionMapState extends State<PotentialDistributionMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationMenuDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF27ae60),
        title: const Text(''),
      ),
      body: Column(
        children: [
          const ExpansionTile(
            title: Text('HEAT MAP',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      '',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      'Potential FAW Distribution',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(0.0), // Set radius to 0 for no outline
            ),
            elevation: 0, // Set elevation to 0 for no shadow
            child: Image.asset(
              'assets/images/FAW Potential distribution.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: PopupMenuButton<String>(
          icon: Icon(Icons.menu, color: Colors.black, size: 30),
          onSelected: (value) {
            switch (value) {
              case 'option1':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapRoute(),
                  ),
                );
                break;
              case 'option2':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoricalDistribution(),
                  ),
                );
                break;
              case 'option3':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PotentialDistributionMap(),
                  ),
                );
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
}
