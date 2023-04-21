import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/def.dart';
import 'package:portfolio_final_omar/providers/screen_provider.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:provider/provider.dart';
import '../../constants/root.dart';

class WorkDetails extends StatefulWidget {
  const WorkDetails({super.key});

  @override
  State<WorkDetails> createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.grey.shade300,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () => context.read<ScreenProvider>().reset(), icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.black)),
            Card(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(Def.cardBorderRadius), child: Image.asset('asset/images/B1.jpg', height: 300, width: double.infinity, fit: BoxFit.cover))),
            myText('Blood Bank Managment System',
                fontFamily: 'Rubik',
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                fontWeight: FontWeight.bold,
                fontsize: 24,
                maxLines: 2,
                alignment: Alignment.centerLeft,
                color: Colors.black),
            myText('Published Date: 29 April 2023, Thursday, 03:00 PM',
                fontWeight: FontWeight.bold,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                fontsize: 12,
                fontFamily: 'SofiaSans',
                maxLines: 4,
                alignment: Alignment.topLeft,
                color: Colors.black45),
            myText(ROOT.loremIpsum,
                fontWeight: FontWeight.bold,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                fontsize: 14,
                fontFamily: 'SofiaSans',
                maxLines: 100,
                alignment: Alignment.topLeft,
                color: Colors.black87),
            myText(ROOT.loremIpsum,
                fontWeight: FontWeight.bold,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                fontsize: 14,
                fontFamily: 'SofiaSans',
                maxLines: 100,
                alignment: Alignment.topLeft,
                color: Colors.black87),
            myText(ROOT.loremIpsum,
                fontWeight: FontWeight.bold,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                fontsize: 14,
                fontFamily: 'SofiaSans',
                maxLines: 100,
                alignment: Alignment.topLeft,
                color: Colors.black87),
          ],
        ),
      ),
    );
  }
}
