// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart' show BuildContext, Column, CrossAxisAlignment, EdgeInsets, MainAxisAlignment, Padding, Row, StatelessWidget, Text, Widget;

class BodyColumn extends StatelessWidget {
  const BodyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('dòng 1'),
          Text('dòng 2'),
          Text('dòng 3'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('cột 1'),
              Text('cột 2'),
              Text('cột 3'),
              Column(
                children: [
                  Text('dòng 4 cột 4'),
                  Text('dòng 5 cột 4'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
