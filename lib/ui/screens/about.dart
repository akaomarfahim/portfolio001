import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import '../../constants/global_keys.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: SingleChildScrollView(
        key: MyGlobalKey.aboutKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myText(
              'About Me',
              alignment: Alignment.centerLeft,
              color: Colors.grey.shade200,
              fontsize: 24,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
