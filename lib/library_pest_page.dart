import 'dart:convert';
import 'package:eirmuplb/image_preview.dart';
import 'package:eirmuplb/surveys.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:eirmuplb/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'library_insecticide.dart';

class PestLibraryPageRoute extends StatefulWidget {
  final int index;
  const PestLibraryPageRoute(this.index);

  @override
  _PestLibraryPageRouteState createState() => _PestLibraryPageRouteState();
}

final List<String> imagelist0 = [
  "assets/images/fallarmyworm.png",
  "assets/images/fawlarva1.jpeg",
  "assets/images/fawlarva2.jpeg",
  "assets/images/fawpupa1.jpeg",
  "assets/images/fawpupa2.jpeg",
  "assets/images/fawpupa3.jpeg",
  "assets/images/fawpupa4.jpeg",
  "assets/images/fawadult1.jpeg",
  "assets/images/fawadult2.jpeg",
  "assets/images/fawadult3.jpeg",
  "assets/images/fawadult4.jpeg",
  "assets/images/fawadult5.jpeg",
  "assets/images/fawegg1.jpeg",
  "assets/images/fawegg2.jpeg",
  "assets/images/fawegg3.jpeg",
  "assets/images/fawegg4.jpeg",
  "assets/images/fawegg5.jpeg",
];
final List<String> imagelist1 = ["assets/images/onionarmyworm.png"];

class _PestLibraryPageRouteState extends State<PestLibraryPageRoute> {
  final controller = CarouselSliderControllerImpl();

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: NavigationMenuDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xFF27ae60),
          title: const Text('Pest Control Information'),
          bottom: const TabBar(
            tabs: [
              Icon(Icons.search),
              Icon(Icons.history),
              Icon(Icons.pest_control),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(child: (widget.index == 0) ? SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: imagelist0.length,
                      itemBuilder: (context, index, realIndex) {
                        final assetImage = imagelist0[index];
                        return buildImage(assetImage, index);
                      },
                      options: CarouselOptions(
                        height: 250,
                        viewportFraction: 1,
                        pageSnapping: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason)
                        {
                          setState(() => activeIndex = index);
                          print(activeIndex);
                        },
                      )
                  ),
                  const SizedBox(height: 32,),
                  buildIndicator(17),
                  const SizedBox(height: 32,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Row(
                      children: [
                        Text(
                          'Information',
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Common name',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Fall Armyworm (FAW)',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Plant affected',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Corn',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Order/Family',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Lepidoptera: Noctuidae',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Scientific name',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Spodoptera frugiperda',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Other name/s',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '-',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Stages of Development',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Egg: 2-3 days',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Larva: (6 instars) 14-22 days',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Pupa: 8-30 days',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Adult: 10-22 days',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Description',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'The larva has upside-down \'Y\' mark on the head. Second last segment on the back has 4 distinct spots forming a square like figure.',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Host range',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Corn, Rice, Sorghum, Wheat, and other vegetable crops',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Damage characteristics',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Feeds on whole plant above soil level.',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Management practice',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Use resistant variety:',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'stacked traits',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Cultural Practices:',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Ploughing under corn stubbles after harvest',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Strictly follow synchronous planting',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Weed management (sanitation)',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Hand picking',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Biological Control:',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Release Trichogramma chilonis for egg masses.',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '1st release - 14 DAP @ 50 cars/release/ha',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '2nd release - 21 DAP @ 50 cards/release/ha',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '3rd release - 28 DAP @ 50 cards/release/ha',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '(optional depends on the presence of egg)',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Release Earwig, <i>Euborellia sp.',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '1st release - 7 DAP @ 2 colonies/release/ha',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '2nd release - 14 DAP @ 2 colonies/release/ha',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '3rd release - 21 DAP @ 2 colonies/release/ha',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Spray of Metarhizium sp.',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '1st spray - 14 DAP @ 100 packs/ha/spraying',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '2nd spray - 21 DAP @ 100 packs/ha/spraying',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '3rd spray - 28 DAP @ 100 packs/ha/spraying',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Chemical Control:',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'FPA has issued conditional registration on the following active ingredients. Apply recommended insecticide with contact and stomach activity following the manufacturer recommendation.',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'BACILLUS THURINGIENSIS SUBSP. AIZAWAI, Toxicity Category: 4, MoA: Group 11A',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'BACILLUS THURINGIENSIS VAR. KURSTAKI, Toxicity Category: 4, MoA: Group 11A',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'CARBOSULFAN, Toxicity Category: 2, MoA: Group 1A',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'CHLORANTRANILIPROLE, Toxicity Category: 4, MoA: Group 28',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'CHLORANTRANILIPROLE + THIAMETHOXAM, Toxicity Category: 4, MoA: Group 28 + Group 4A',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'CHLORFLUAZURON,Toxicity Category: 4, MoA: Group 15',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'CRY1A.105 & CRY2AB2, MoA: Group 11A',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'CYANTRANILIPROLE, Toxicity Category: 4, MoA: Group 28',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'EMAMECTIN BENZOATE, Toxicity Category: 3, MoA: Group 6',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'INDOXACARB, MoA: Group 22A',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'LAMBDACYHALOTHRIN, Toxicity Category: 2, MoA: Group 3A',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'LUFENURON, MoA: Group 15',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'PYRIDALYL, Toxicity Category: 4',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'SPINETORAM, Toxicity Category: 4, MoA: Group 5',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'TETRANILIPROLE, Toxicity Category: 3, MoA: Group 28',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '(E,Z) 9,11 TETRADECADIENYL ACETATE, Toxicity Category: 4',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            '(Z)-9-TETRADECENYL ACETATE, Toxicity Category: 4',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Image source:',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Gideon Aries S. Burgonio / Laoag, Ilocos Norte / 2019.',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            )   :
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: imagelist1.length,
                      itemBuilder: (context, index, realIndex) {
                        final assetImage = imagelist1[index];
                        return buildImage(assetImage, index);
                      },
                      options: CarouselOptions(
                        height: 250,
                        viewportFraction: 1,
                        pageSnapping: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason)
                        {
                          setState(() => activeIndex = index);
                          print(activeIndex);
                        },
                      )
                  ),
                  const SizedBox(height: 32,),
                  buildIndicator(1),
                  const SizedBox(height: 32,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Row(
                      children: [
                        Text(
                          'Information',
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Common name',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Onion Armyworm (OAW)',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Plant affected',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Onion',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Order/Family',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Lepidoptera: Noctuidae',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Scientific name',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Spodoptera exigua Hubner',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Other name/s',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Beet Armyworm',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Filipino name/s',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Harabas',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Stages of Development',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Egg: 2-3 days',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Larva: (6 instars) 15-17 days',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Pupa: 6-7 days',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Adult: 7-10 days',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Description',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'The female lays pale greenish or pinkish, striated eggs, in masses that are covered with white, cottony material (bristles from the body of the female). Each egg mass contains 50-150 eggs, each about 0.7 mm diameter. Larvae stay together after they hatch; later, they spread out and each one stays alone, one or two per plant as the larger stages are cannibalistic. They are pale green or yellow at first, and become a dull green with wavy, light colored stripes down the sides below the breathing holes, and a broader dark brown stripe above.',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Host range',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Cucurbits, Solanaceous crops, Legumes, Cotton, Tobacco',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Damage characteristics',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'The larvae eat the leaves - the young ones feed on the outside scraping the surface, the larger ones make irregular holes in the leaves or eat the leaves completely."',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Management practice',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Cultural Control:',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Monitor the area regularly',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Hand pick the larvae to reduce the population',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Plant trap crops like sunflower',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Taro or castor plants around the area',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Physical/Mechanical Control:',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Remove weeds and volunteer plants that may serve as alternate hosts',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Use pheromone traps to lure the male adults',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Biological Control:',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Use  pathogens like nuclear polyhedrosis virus (NPV) and entomopathogenic fungi',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Aspegillus falvus',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Chemical Control:',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Apply chemicals such as Lambda-Cyhalothrin/Cypermethrin/Fenitrothion',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Image source:',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'CLARRDEC. (2007). Major diseases of onion: A field guide. Central Luzon Agriculture and Resources Research and Development Consortium (CLARRDEC). A field guide (p. 18). (CLARRDEC Farm Primer No. 02/2007).',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Contributors:',
                            style:
                            TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Kennilyn May Balbin  (kennilynmay@gmail.com)',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Dr. Ronaldo T. Alberto (travert2157@gmail.com)',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Miguelito F. Isip (miguelitoisip21@gmail.com)',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text(
                            'Links:https: //onionpest-surveillance.iccem.com.ph',
                            style:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),),
            Container( child: (widget.index == 0) ? SingleChildScrollView(
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
                          'FAW History',
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
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/fawglobalspread.png')));
                            }, // Image tapped
                            splashColor: Colors.white10, // Splash color over image
                            child: Ink.image(
                              height: MediaQuery.of(context).size.width *.4,
                              width: MediaQuery.of(context).size.width *.8,
                              fit: BoxFit.cover, // Fixes border issues
                              image: const AssetImage(
                                  'assets/images/fawglobalspread.png'
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Global Spread of FAW as of July 2020.',
                                  style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Map conforms to United Nations No. 4170 Rev. 18.1 map, February 2020. http://www.fao.org/fall-armyworm/en/',
                                  style:
                                  TextStyle(fontSize: 12,),
                                ),
                                Text(
                                  'Pre- 2016- north America',
                                  style:
                                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '2016- Central and West Africa',
                                  style:
                                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '2018- India and Yemen, Sri Lanka, Bangladesh, Myanmar, Thailand and China.',
                                  style:
                                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '2019- Philippines',
                                  style:
                                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '2020- Australia, Mauritania, Timor-Leste and United Arab Emirates.',
                                  style:
                                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/fawhost1.png')));
                                }, // Image tapped
                                splashColor: Colors.white10, // Splash color over image
                                child: Ink.image(
                                  height: MediaQuery.of(context).size.width *.50,
                                  width: MediaQuery.of(context).size.width *.35,
                                  fit: BoxFit.cover, // Fixes border issues
                                  image: const AssetImage(
                                      'assets/images/fawhost1.png'
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/fawhost2.png')));
                                }, // Image tapped
                                splashColor: Colors.white10, // Splash color over image
                                child: Ink.image(
                                  height: MediaQuery.of(context).size.width *.50,
                                  width: MediaQuery.of(context).size.width *.35,
                                  fit: BoxFit.cover, // Fixes border issues
                                  image: const AssetImage(
                                      'assets/images/fawhost2.png'
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
                                  'FAW - highly polyphagous feeding in more than 350 host plants',
                                  style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Assessment of the Host Rangeof Fall Armyworm, Spodoptera frugiperda Smith (Lepidoptera: Noctuidae) in Manica Province, Mozambique.',
                                  style:
                                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Albacini Caniço, António Mexia, Luisa Santos',
                                  style:
                                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'FAW Outbreak',
                            style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/fawoutbreak.png')));
                            }, // Image tapped
                            splashColor: Colors.white10, // Splash color over image
                            child: Ink.image(
                              height: MediaQuery.of(context).size.width *.25,
                              width: MediaQuery.of(context).size.width *.6,
                              fit: BoxFit.cover, // Fixes border issues
                              image: const AssetImage(
                                  'assets/images/fawoutbreak.png'
                              ),
                            ),
                          ),
                        ]
                    ),),
                ],),
            ) :
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 32,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      children: [
                        Text(
                          'OAW History',
                          style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, 0, 20, 20),
                    child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/oawmigrationpattern.png')));
                            }, // Image tapped
                            splashColor: Colors.white10, // Splash color over image
                            child: Ink.image(
                              height: MediaQuery.of(context).size.width *.4,
                              width: MediaQuery.of(context).size.width *.8,
                              fit: BoxFit.cover, // Fixes border issues
                              image: const AssetImage(
                                  'assets/images/oawmigrationpattern.png'
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                            child: Column(
                              children: [
                                Text(
                                  'Migratory pattern of OAW in the USA, UK, Fennoscandia, Japan and China. ',
                                  style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Thin arrows indicates the direction of the migration, the broken ones are back track. The big arrow indicates wind direction by month (passing through the Philippines). (After Zheng et al.. 2011. Journal of the Entomological Research Society, 13(3): 39-48. ',
                                  style:
                                  TextStyle(fontSize: 12,),
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
                                  MaterialPageRoute(builder: (context) => ImagePreviewPageRoute('assets/images/oawhostpics.png')));
                            }, // Image tapped
                            splashColor: Colors.white10, // Splash color over image
                            child: Ink.image(
                              height: MediaQuery.of(context).size.width *.50,
                              width: MediaQuery.of(context).size.width *.35,
                              fit: BoxFit.cover, // Fixes border issues
                              image: const AssetImage(
                                  'assets/images/oawhostpics.png'
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'OAW- infests both weeds and crops plants',
                                  style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '*Biological Studies of OAW (Sci. Marcela M. Navasero)',
                                  style:
                                  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ]
                    ),),
                ],),
            )),
            Container( child: (widget.index == 0) ? SingleChildScrollView(
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
                            'Local Farmers Against FAW',
                            style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Click here to learn more about surveyed farmers\' practices against FAW', textAlign: TextAlign.center, style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SurveysRoute()));
                    },),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, 0, 20, 10),
                    child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Common Methods of Elimination',
                                  style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10,),
                                Table(
                                  border: TableBorder.all(color: Colors.green, width: 1.5),
                                  children: const [
                                    TableRow(children: [
                                      Text("1", style: TextStyle(fontSize: 15.0),),
                                      Text("Pesticides", style: TextStyle(fontSize: 15.0),),
                                    ]),
                                    TableRow(children: [
                                      Text("2", style: TextStyle(fontSize: 15.0),),
                                      Text("Manual Removal", style: TextStyle(fontSize: 15.0),),
                                    ]),
                                    TableRow(children: [
                                      Text("3", style: TextStyle(fontSize: 15.0),),
                                      Text("Plant Extract & Residue", style: TextStyle(fontSize: 15.0),),
                                    ]),
                                    TableRow(children: [
                                      Text("4", style: TextStyle(fontSize: 15.0),),
                                      Text("Ash & Soap", style: TextStyle(fontSize: 15.0),),
                                    ]),
                                    TableRow(children: [
                                      Text("5", style: TextStyle(fontSize: 15.0),),
                                      Text("Biological Control", style: TextStyle(fontSize: 15.0),),
                                    ]),
                                    TableRow(children: [
                                      Text("6", style: TextStyle(fontSize: 15.0),),
                                      Text("Smoke Fumigation", style: TextStyle(fontSize: 15.0),),
                                    ]),
                                    TableRow(children: [
                                      Text("6", style: TextStyle(fontSize: 15.0),),
                                      Text("Light Traps", style: TextStyle(fontSize: 15.0),),
                                    ]),
                                  ],
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
                              children: [
                                Text(
                                  'Desperation of Local Farmers',
                                  style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Due to Insecticide resistance from the registered commercially available insecticides, many farmers resort to non-insecticide materials',
                                  style:
                                  TextStyle(fontSize: 14,),
                                ),
                                SizedBox(height: 10,),
                                Table(
                                  border: TableBorder.all(color: Colors.green, width: 1.5),
                                  children: const [
                                    TableRow(children: [
                                      Text("disinfectants, oil & tar, and wine & food additives", style: TextStyle(fontSize: 15.0),),
                                    ]),
                                    TableRow(children: [
                                      Text("banned, restricted, and smuggled", style: TextStyle(fontSize: 15.0),),
                                    ]),
                                  ],
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
                              children: [
                                Text(
                                  'Cocktailing',
                                  style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'About 31% of our local farmers still practice cocktailing; 21% mix 2 insecticide brands, 4% mix 3 brands, and 5.5% mix more that 3 brands.',
                                  style:
                                  TextStyle(fontSize: 14,),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  'Cocktailing is NOT ENCOURAGED',
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
                ],),
            ) :
            Center(child: Text('To be researched'),)),
          ],
        ),
        ),
    );
  }
  Widget buildImage(String sourceImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 12),
    color: Colors.grey,
    child: GestureDetector(
      child: PhotoView(
        imageProvider: AssetImage(sourceImage),
      ),
      // child: Image.asset(
      //   sourceImage,
      //   fit: BoxFit.cover,),
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => PestLibraryPageRoute(activeIndex)),
      //   );
      // },
    ),
  );
  Widget buildIndicator(int count) => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    activeIndex: activeIndex,
    count: count,
    effect: const SlideEffect(
        dotHeight: 10,
        dotWidth: 10
    ),
  );

  void animateToSlide(int index) => controller.animateToPage(index);
}
