import 'package:flutter/material.dart';

class BoxHeading extends StatelessWidget {
  final String txt;
  final Color color;
  const BoxHeading({
    Key? key,
    required this.txt,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: MediaQuery.of(context).size.width * 0.25,
      color: color,
      child: Center(child: Text(txt)),
    );
  }
}
