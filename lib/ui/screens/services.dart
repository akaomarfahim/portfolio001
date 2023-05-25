import 'package:flutter/material.dart';

import '../../widgets/widget_default/__text.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade300,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
              'Under Construction\nServices Page',
              fontSize: 34,
              textColor: Colors.white,
              fontWeight: FontWeight.bold,
            )
          ],
        ));
  }
}
