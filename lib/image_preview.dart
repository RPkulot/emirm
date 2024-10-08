import 'dart:convert';

import 'package:eirmuplb/main.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class ImagePreviewPageRoute extends StatelessWidget {
  const ImagePreviewPageRoute( @required this.imagesource);
  final imagesource;
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationMenuDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF27ae60),
        title: const Text('Research Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 35,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      offset: Offset(0,12)
                  )],
                  color: Colors.blueGrey[800],
                  borderRadius: BorderRadius.only(
                      bottomLeft:  Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))
              ),
              child: PhotoView(
                imageProvider: AssetImage(imagesource),
              ),),),
        ],
      ),
    );
  }
}

