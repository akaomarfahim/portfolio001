import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/global_keys.dart';
import 'package:portfolio_final_omar/models/works_model.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:portfolio_final_omar/ui/screens/work_details.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/def.dart';
import '../../providers/screen_provider.dart';
import '../../utils/__colors.dart';
import '../../utils/__screen.dart';
import '../../widgets/widget_default/__hover.dart';
import '../../widgets/widget_default/__text.dart';

class Works extends StatefulWidget {
  const Works({super.key});

  @override
  State<Works> createState() => _WorksState();
}

class _WorksState extends State<Works> {
  bool isLoadingComplete = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    setState(() => isLoadingComplete = false);
    await WorksModel.getData();
    setState(() => isLoadingComplete = true);
  }

  @override
  Widget build(BuildContext context) {
    return !isLoadingComplete
        ? const SplashScreen()
        : Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 40),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          for (int i = 0; i < WorksModel.items.length; i++) ItemWithPhotoHoverAndBottomBox(item: WorksModel.items[i]),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20)
                  ],
                )));
  }
}

class ItemWithPhotoHoverAndBottomBox extends StatelessWidget {
  final WorksModel item;
  const ItemWithPhotoHoverAndBottomBox({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double width = context.isMobile
        ? MediaQuery.of(context).size.width
        : Screen.isDesktop(context)
            ? 300
            : 280;

    double height = 220;
    return OnHover(
        transform: Matrix4.identity()..scale(1.03),
        builder: (isHovered) => SizedBox(
              width: width,
              child: InkWell(
                  onTap: () => context.read<ScreenProvider>().setPage(WorkDetails(item: item)),
                  child: Column(children: [
                    Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(Def.cardBorderRadius)),
                            child: Image.network(item.imageUrl, width: width, height: height, fit: BoxFit.cover)),
                        AnimatedContainer(
                            height: height,
                            width: width,
                            alignment: Alignment.center,
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
                                  child: myText(item.category, fontsize: 12, padding: const EdgeInsets.symmetric(horizontal: 10), maxLines: 1),
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
                                  item.title,
                                  // shadows: [const BoxShadow(blurRadius: 4, spreadRadius: 4, color: Colors.black54, offset: Offset(1, 1))],
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.bold,
                                  fontsize: 20,
                                  color: Colors.black,
                                ),
                                myText(item.tagLine,
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
                      ],
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 1),
                        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: const BorderRadius.vertical(bottom: Radius.circular(Def.cardBorderRadius))),
                        child: Column(
                          children: [
                            myText(item.title,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w600,
                                maxLines: 2,
                                padding: const EdgeInsets.only(bottom: 8),
                                alignment: Alignment.topLeft,
                                color: Colors.black),
                            myText(item.description, fontsize: 12, fontFamily: 'SofiaSans', maxLines: 4, alignment: Alignment.topLeft, color: Colors.black),
                            myText('Project Duration: ${item.projectDuration}',
                                fontWeight: FontWeight.bold,
                                padding: const EdgeInsets.only(top: 5),
                                fontsize: 12,
                                fontFamily: 'SofiaSans',
                                maxLines: 4,
                                alignment: Alignment.topLeft,
                                color: Colors.black),
                            myText('Platforms: ${item.projectPlatform}',
                                fontWeight: FontWeight.bold,
                                padding: const EdgeInsets.only(top: 2),
                                fontsize: 12,
                                fontFamily: 'SofiaSans',
                                maxLines: 4,
                                alignment: Alignment.topLeft,
                                color: Colors.black),
                            myText('Application Frame: ${item.applicationFrame}',
                                fontWeight: FontWeight.bold,
                                padding: const EdgeInsets.only(top: 2),
                                fontsize: 12,
                                fontFamily: 'SofiaSans',
                                maxLines: 4,
                                alignment: Alignment.topLeft,
                                color: Colors.black),
                          ],
                        ))
                  ])),
            ));
  }
}
