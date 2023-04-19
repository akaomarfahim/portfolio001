import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/global_keys.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
        key: MyGlobalKey.aboutKey,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            myText('Under Construction\nAbout Page', fontsize: 34, color: Colors.white, fontWeight: FontWeight.bold),
            myText('Under Construction\nAbout Page', fontsize: 34, color: Colors.white, fontWeight: FontWeight.bold),
            myText('Under Construction\nAbout Page', fontsize: 34, color: Colors.white, fontWeight: FontWeight.bold),
            myText('Under Construction\nAbout Page', fontsize: 34, color: Colors.white, fontWeight: FontWeight.bold),
          ],
        ));
  }
}
