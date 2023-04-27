import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/def.dart';
import '../../constants/global_keys.dart';
import '../../utils/__screen.dart';
import '../../widgets/widget_default/__hover.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey.shade300,
      // alignment: Alignment.center,
      // padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      // color: Colors.white,
      child: SingleChildScrollView(
        key: MyGlobalKey.blogsKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myText('Recent Posts',
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                alignment: Alignment.centerLeft,
                color: Colors.black87,
                fontsize: 24,
                fontWeight: FontWeight.w500),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 40, 10),
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                spacing: 30,
                runSpacing: 30,
                children: const [
                  BlogItem(),
                  BlogItem(),
                  BlogItem(),
                  BlogItem(),
                  BlogItem(),
                ],
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

class BlogItem extends StatelessWidget {
  const BlogItem({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.isMobile
        ? MediaQuery.of(context).size.width
        : Screen.isDesktop(context)
            ? Screen.width(context) * 0.22
            : 280;
    double height = 220;
    return OnHover(
        transform: Matrix4.identity()..scale(1.03),
        builder: (isHovered) => InkWell(
                // onTap: () => context.read<ScreenProvider>().setPage(WorkDetails()),
                child: SizedBox(
              width: width,
              child: Column(children: [
                Stack(clipBehavior: Clip.none, fit: StackFit.loose, alignment: Alignment.center, children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(Def.cardBorderRadius)),
                      child: Image.asset('asset/images/app_ss.jpg',
                          colorBlendMode: BlendMode.darken, color: Colors.black.withOpacity(0.2), fit: BoxFit.cover, height: height, width: width)),
                  Positioned(
                      top: 0,
                      left: 20,
                      child: Container(
                        height: 30,
                        child: myText('Flutter Development',
                            fontFamily: 'SofiaSans',
                            fontsize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            maxLines: 1),
                        decoration: BoxDecoration(
                            color: Colors.yellow.shade700,
                            boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 1, color: Colors.black38, offset: Offset.fromDirection(1, 2))],
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(Def.cardBorderRadius))),
                      ))
                ]),
                Container(
                    width: width,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(bottom: Radius.circular(Def.cardBorderRadius))),
                    child: Column(
                      children: [
                        myText('Blood Bank Managment System for the jati of the worl for blood here Here is the big text for thsi one',
                            fontFamily: 'Rubik', fontWeight: FontWeight.w600, padding: const EdgeInsets.only(bottom: 4), alignment: Alignment.topLeft, color: Colors.black),
                        myText('10 April 2023, Tuesday, 03:00 PM | Omar Fahim',
                            fontWeight: FontWeight.bold,
                            padding: const EdgeInsets.only(top: 5),
                            fontsize: 12,
                            fontFamily: 'SofiaSans',
                            maxLines: 4,
                            alignment: Alignment.topLeft,
                            color: Colors.grey.shade700),
                      ],
                    ))
              ]),
            )));
  }
}
