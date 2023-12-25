// ignore: file_names
import 'package:flutter/material.dart' show Alignment, BuildContext, Center, Colors, Container, EdgeInsets, StatelessWidget, Text, Widget;

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          width: 100,
          height: 100,
          color: Colors.green,
          child: const Text("Ví dụ đầu tiên"),
        ),
      ),
    );
  }
}
