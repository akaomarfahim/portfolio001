import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText('E-mail : akaomarfahim@gmail.com', textColor: Colors.white),
            MyText('phone : +880 18398 65200', textColor: Colors.white),
          ],
        ));
  }
}
