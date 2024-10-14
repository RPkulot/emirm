import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/myfarm.dart';


final _lightColors = [
  Colors.green.shade200,
  Colors.green.shade400,
  Colors.green.shade100,
  Colors.green.shade800,
  Colors.green.shade300,
  Colors.green.shade700,
];

class MyFarmWidget extends StatelessWidget {
  const MyFarmWidget({
    Key? key,
    required this.farm,
    required this.index,
  }) : super(key: key);

  final Farm farm;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(farm.createdTime);
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                farm.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                time,
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}