import 'package:flutter_switch/flutter_switch.dart';
import 'package:eirmuplb/main.dart';
import 'package:flutter/material.dart';
import 'library_MoA.dart';
import 'library_insecticide.dart';
import 'library_msds.dart';
import 'library_pest_page.dart';

class ELearnRoute extends StatefulWidget {
  @override
  _ELearnRouteState createState() => _ELearnRouteState();
}

class _ELearnRouteState extends State<ELearnRoute> {
  late String keyword = '';
  int activeIndex = 0;
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: NavigationMenuDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xFF27ae60),
          title: const Text('Learn'),
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                status == true ? Container(
                  height: 100,
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/fallarmyworm.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(colors: [
                            Colors.yellow.withOpacity(0.8),
                            Colors.black.withOpacity(0.3),
                          ],
                          ),
                        ),
                        child: ListTile(
                          title: Text('Pest info.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PestLibraryPageRoute(status ? 1 : 0),
                            ));
                          },
                        ),
                      ),
                    ),
                  ),
                ) :
                Container(
                  height: 100,
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/onionarmyworm.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(colors: [
                            Colors.purple.withOpacity(0.7),
                            Colors.black.withOpacity(0.3),
                          ],
                          ),
                        ),
                        child: ListTile(
                          title: Text('Pest info.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PestLibraryPageRoute(status ? 1 : 0),
                            ));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: 100,
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/iracmoatablepic.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(colors: [
                            Colors.green.withOpacity(0.7),
                            Colors.black.withOpacity(0.5),
                          ],
                          ),
                        ),
                        child: ListTile(
                          title: Text('Mode of Action (MoA)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LibraryMoARoute(),
                            ));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: 100,
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/insecticide.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(colors: [
                            Colors.green.withOpacity(0.8),
                            Colors.black.withOpacity(0.3),
                          ],
                          ),
                        ),
                        child: ListTile(
                          title: Text('Pesticides', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LibraryInsecticideRoute(),
                            ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                status == true ?
                Container(
                  height: 100,
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/FAW-enemies.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(colors: [
                            Colors.yellow.withOpacity(0.8),
                            Colors.black.withOpacity(0.3),
                          ],
                          ),
                        ),
                        child: ListTile(
                          title: Text('Natural Enemies', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PestLibraryPageRoute(status ? 1 : 0),
                            ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ) :  Container(
                  height: 100,
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/OAW-enemies.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(colors: [
                            Colors.purple.withOpacity(0.7),
                            Colors.black.withOpacity(0.3),
                          ],
                          ),
                        ),
                        child: ListTile(
                          title: Text('Natural Enemies', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PestLibraryPageRoute(status ? 1 : 0),
                            ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: 100,
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/fawegg3.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(colors: [
                            Colors.green.withOpacity(0.7),
                            Colors.black.withOpacity(0.3),
                          ],
                          ),
                        ),
                        child: ListTile(
                          title: Text('Monitoring', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LibraryMsdsRoute()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
