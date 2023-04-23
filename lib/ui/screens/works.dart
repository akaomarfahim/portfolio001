import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/global_keys.dart';
import 'package:portfolio_final_omar/providers/screen_provider.dart';
import 'package:portfolio_final_omar/ui/screens/work_details.dart';
import 'package:provider/provider.dart';

import '../../constants/def.dart';
import '../../utils/__colors.dart';
import '../../widgets/widget_default/__hover.dart';
import '../../widgets/widget_default/__text.dart';

class Works extends StatefulWidget {
  const Works({super.key});

  @override
  State<Works> createState() => _WorksState();
}

class _WorksState extends State<Works> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      // color: Colors.white,
      child: SingleChildScrollView(
        key: MyGlobalKey.worksKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myText('Recent Works',
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                alignment: Alignment.centerLeft,
                color: Colors.grey.shade200,
                fontsize: 24,
                fontWeight: FontWeight.w500),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                ItemWithPhotoHoverAndBottomBox(),
                ItemWithPhotoHoverAndBottomBox(),
                ItemWithPhotoHoverAndBottomBox(),
                ItemWithPhotoHoverAndBottomBox(),
                ItemWithPhotoHoverAndBottomBox(),
                ItemWithPhotoHoverAndBottomBox(),
                ItemWithPhotoHoverAndBottomBox(),
              ],
            )
            // GridView.builder(
            //       shrinkWrap: true,
            //       itemCount: 5,
            //       // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            //       itemBuilder: (context, index) => const ItemWithPhotoHoverAndBottomBox())
          ],
        ),
      ),
    );
  }
}

class ItemWithPhotoHoverAndBottomBox extends StatelessWidget {
  const ItemWithPhotoHoverAndBottomBox({super.key});

  @override
  Widget build(BuildContext context) {
    double width = 260;
    return OnHover(
        transform: Matrix4.identity()..scale(1.03),
        builder: (isHovered) => InkWell(
            onTap: () => context.read<ScreenProvider>().setPage(const WorkDetails()),
            child: Column(children: [
              Card(
                  color: Colors.transparent,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(Def.cardBorderRadius))),
                  child: Container(
                      height: 240,
                      width: width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Def.cardBorderRadius)),
                      child: Stack(clipBehavior: Clip.none, fit: StackFit.loose, alignment: Alignment.center, children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(Def.cardBorderRadius)),
                          child: Image.asset('asset/images/B1.jpg', fit: BoxFit.cover, width: 300),
                        ),
                        AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(Def.cardBorderRadius)),
                              color: isHovered ? Colors.amber.shade400.withOpacity(0.7) : Colors.transparent,
                            )),
                        Positioned(
                            top: 0,
                            left: 20,
                            child: AnimatedOpacity(
                                opacity: isHovered ? 1 : 0,
                                duration: const Duration(milliseconds: 600),
                                child: Container(
                                  height: 30,
                                  // width: 100,
                                  child: myText('Flutter Development', fontsize: 12, padding: const EdgeInsets.symmetric(horizontal: 10), maxLines: 1),
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      boxShadow: [BoxShadow(blurRadius: 8, spreadRadius: 1, color: Colors.black54, offset: Offset.fromDirection(1, 3))],
                                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(Def.cardBorderRadius))),
                                ))),
                        AnimatedOpacity(
                            opacity: isHovered ? 1 : 0,
                            duration: const Duration(milliseconds: 600),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                myText(
                                  'BLOOD BANK MANAGMENT SYSTEM',
                                  // shadows: [const BoxShadow(blurRadius: 4, spreadRadius: 4, color: Colors.black54, offset: Offset(1, 1))],
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.bold,
                                  fontsize: 20,
                                  color: Colors.black,
                                ),
                                myText('Save the world by Sharing blood',
                                    // shadows: [const BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.black38, offset: Offset(1, 1))],
                                    fontWeight: FontWeight.w800,
                                    padding: const EdgeInsets.only(top: 2),
                                    fontsize: 14,
                                    fontFamily: 'SofiaSans',
                                    maxLines: 4,
                                    alignment: Alignment.center,
                                    color: MyColors.primary)
                              ],
                            ))
                      ]))),
              Container(
                  // height: 100,
                  width: width,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 1),
                  decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: const BorderRadius.vertical(bottom: Radius.circular(Def.cardBorderRadius))),
                  child: Column(
                    children: [
                      myText('Blood Bank Managment System for the jati of the worl for blood here Here is the big text for thsi one',
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w600,
                          maxLines: 2,
                          padding: const EdgeInsets.only(bottom: 8),
                          alignment: Alignment.topLeft,
                          color: Colors.black),
                      myText('Blood Bank Managment System for the jati of the worl for blood here Here is the big text for thsi one',
                          fontsize: 12, fontFamily: 'SofiaSans', maxLines: 4, alignment: Alignment.topLeft, color: Colors.black),
                      myText('Project Duration: 3 Months',
                          fontWeight: FontWeight.bold,
                          padding: const EdgeInsets.only(top: 5),
                          fontsize: 12,
                          fontFamily: 'SofiaSans',
                          maxLines: 4,
                          alignment: Alignment.topLeft,
                          color: Colors.black),
                      myText('Platforms: Android',
                          fontWeight: FontWeight.bold,
                          padding: const EdgeInsets.only(top: 2),
                          fontsize: 12,
                          fontFamily: 'SofiaSans',
                          maxLines: 4,
                          alignment: Alignment.topLeft,
                          color: Colors.black),
                      myText('Application Frame: Flutter, Figma, VS Code',
                          fontWeight: FontWeight.bold,
                          padding: const EdgeInsets.only(top: 2),
                          fontsize: 12,
                          fontFamily: 'SofiaSans',
                          maxLines: 4,
                          alignment: Alignment.topLeft,
                          color: Colors.black),
                    ],
                  ))
            ])));
  }
}
