import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key, required this.desciption});

  final String desciption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(desciption)],
    );
  }
}
