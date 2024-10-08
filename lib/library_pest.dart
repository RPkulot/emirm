import 'dart:convert';

import 'package:eirmuplb/main.dart';
import 'package:flutter/material.dart';

import 'library_pest_page.dart';

class LibraryPestRoute extends StatefulWidget {
  @override
  _LibraryPestRouteState createState() => _LibraryPestRouteState();
}

class _LibraryPestRouteState extends State<LibraryPestRoute> {
  late String keyword = '';
  int activeIndex = 0;
  final insectList = [
    {
      'name': 'Fall Armyworm',
      'description':
      'corn pest',
      'image': "assets/images/fallarmyworm.png"
    },
    {
      'name': 'Onion Armyworm',
      'description':
      'onion pest',
      'image': "assets/images/onionarmyworm.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: NavigationMenuDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xFF27ae60),
          title: const Text('Insect Library'),
        ),
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CarouselSlider.builder(
        //         carouselController: controller,
        //         itemCount: insectList.length,
        //         itemBuilder: (context, index, realIndex) {
        //           final assetImage = insectList[activeIndex]['image'].toString();
        //           return buildImage(assetImage, index);
        //         },
        //         options: CarouselOptions(
        //             height: 250,
        //             viewportFraction: 1,
        //             pageSnapping: true,
        //             enableInfiniteScroll: true,
        //             onPageChanged: (index, reason)
        //             {
        //               setState(() => activeIndex = index);
        //               print(activeIndex);
        //             },)
        //     ),
        //     const SizedBox(height: 32,),
        //     buildIndicator(),
        //     const SizedBox(height: 32,),
        //     Expanded(
        //       child: Container(
        //         decoration: BoxDecoration(
        //           boxShadow: [BoxShadow(
        //             color: Colors.grey.withOpacity(1),
        //             offset: Offset(0,-12)
        //           )],
        //             color: Colors.blueGrey[800],
        //             borderRadius: BorderRadius.only(
        //                 topLeft:  Radius.circular(10.0),
        //                 topRight: Radius.circular(10.0))
        //         ),
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: <Widget>[
        //             ListTile(
        //               textColor: Colors.white,
        //               title: Text(insectList[activeIndex]['name'].toString()),
        //               subtitle: Text(insectList[activeIndex]['description'].toString()),
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(builder: (context) => PestLibraryPageRoute(index:activeIndex)),
        //                 );
        //               },
        //             ),
        //           ],
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        body: SingleChildScrollView(
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: insectList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // leading: Icon(Icons.local_pharmacy, size: 40,),
                      title: Text(insectList[index]['name'].toString()),
                      subtitle: Text(insectList[index]['description'].toString()),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => PestLibraryPageRoute(index)));
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Widget buildImage(String sourceImage, int index) => Container(
  //   margin: EdgeInsets.symmetric(horizontal: 12),
  //   color: Colors.grey,
  //   child: GestureDetector(
  //     child: Image.asset(
  //       sourceImage,
  //       fit: BoxFit.cover,),
  //       onTap: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => PestLibraryPageRoute(index:activeIndex)),
  //         );
  //         },
  //   ),
  // );
  // Widget buildIndicator() => AnimatedSmoothIndicator(
  //   onDotClicked: animateToSlide,
  //   activeIndex: activeIndex,
  //   count: 2,
  //   effect: const SlideEffect(
  //     dotHeight: 30,
  //     dotWidth: 30
  //   ),
  // );
  //
  // void animateToSlide(int index) => controller.animateToPage(index);

}
