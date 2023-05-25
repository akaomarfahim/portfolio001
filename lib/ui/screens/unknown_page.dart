import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';

class UnknownPage extends StatefulWidget {
  const UnknownPage({super.key});

  @override
  State<UnknownPage> createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: const MyText('Unkown Page 404! Error'),
      )),
    );
  }
}
