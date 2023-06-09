import 'package:flutter/material.dart';

import '../../constants/global_keys.dart';
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
        key: MyGlobalKey.servicesKey,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade300,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            myText(
              'Under Construction\nServices Page',
              fontsize: 34,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
          ],
        ));
  }
}
