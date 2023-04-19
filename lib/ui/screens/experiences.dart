import 'package:flutter/material.dart';

import '../../constants/global_keys.dart';
import '../../widgets/widget_default/__text.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  @override
  Widget build(BuildContext context) {
    return Container(
        key: MyGlobalKey.experienceKey,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            myText(
              'Under Construction\nExperience Page',
              fontsize: 34,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
          ],
        ));
  }
}
