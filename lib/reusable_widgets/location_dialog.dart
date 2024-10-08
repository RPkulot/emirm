import 'package:flutter/material.dart';

class LocationDialogWidget extends StatefulWidget {
  @override
  _LocationDialogWidgetState createState() => _LocationDialogWidgetState();
}

class _LocationDialogWidgetState extends State<LocationDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String address = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Place',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              'Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      );
}
