import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_final_omar/backend/Firebase/firebase_backend.dart';
import 'package:portfolio_final_omar/constants/root.dart';
import 'package:portfolio_final_omar/models/works_model.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/def.dart';
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
    DatabaseReference ref = FirebaseAPI.connect.child('works');
    ref.onValue.listen((event) async {
      await WorksModel.getData();
      setState(() {});
    });
    setState(() => isLoadingComplete = true);
  }

  @override
  Widget build(BuildContext context) {
    return !isLoadingComplete
        ? const SplashScreen()
        : WorksModel.items.isEmpty
            ? const Center(child: MyText('Nothing to show', textColor: Colors.white, fontWeight: FontWeight.w500))
            : Stack(
                children: [
                  // Opacity(opacity: 0.08, child: Image.asset('asset/images/solar.gif', height: double.infinity, width: double.infinity, fit: BoxFit.cover)),
                  Container(
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 40),
                      // color: Colors.white,
                      child: SingleChildScrollView(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText('Recent Works',
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              alignment: Alignment.centerLeft,
                              textColor: Colors.grey.shade200,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: Wrap(spacing: 20, runSpacing: 20, children: WorksModel.items.map((e) => ItemWithPhotoHoverAndBottomBox(item: e)).toList().reversed.toList())),
                          const SizedBox(height: 20)
                        ],
                      ))),
                ],
              );
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
            ? Screen.width(context) * 0.24
            : 280;
    double height = 220;
    return OnHover(
        transform: Matrix4.identity()..scale(1.03),
        builder: (isHovered) => SizedBox(
              width: width,
              child: InkWell(
                  // onTap: () => context.read<ScreenProvider>().setPage(WorkDetails(item: item)),
                  onTap: () => Get.toNamed('/works/${item.key}'),
                  child: Column(children: [
                    Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(Def.cardBorderRadius)),
                            child: Image.network(item.imageUrl ?? FirebaseDataRoot.imageErrorLink, width: width, height: height, fit: BoxFit.cover)),
                        AnimatedContainer(
                            height: height,
                            width: width,
                            alignment: Alignment.center,
                            duration: const Duration(milliseconds: 400),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(Def.cardBorderRadius)),
                                color: isHovered ? Colors.amber.shade400.withOpacity(0.7) : Colors.transparent)),
                        Positioned(
                            top: 0,
                            left: 20,
                            child: AnimatedOpacity(
                                opacity: isHovered ? 1 : 0,
                                duration: const Duration(milliseconds: 600),
                                child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        boxShadow: [BoxShadow(blurRadius: 8, spreadRadius: 1, color: Colors.black54, offset: Offset.fromDirection(1, 3))],
                                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(Def.cardBorderRadius))),
                                    child: MyText(item.category,
                                        fontSize: 12,
                                        alignment: Alignment.center,
                                        textAlign: TextAlign.center,
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        maxLines: 1)))),
                        AnimatedOpacity(
                            opacity: isHovered ? 1 : 0,
                            duration: const Duration(milliseconds: 600),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MyText(
                                  item.title,
                                  // shadows: [const BoxShadow(blurRadius: 4, spreadRadius: 4, color: Colors.black54, offset: Offset(1, 1))],
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  textColor: Colors.black,
                                ),
                                MyText(item.motto,
                                    // shadows: [const BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.black38, offset: Offset(1, 1))],
                                    fontWeight: FontWeight.w800,
                                    padding: const EdgeInsets.only(top: 2),
                                    fontSize: 14,
                                    fontFamily: 'SofiaSans',
                                    maxLines: 3,
                                    alignment: Alignment.center,
                                    textColor: Colors.black)
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
                            MyText(item.title,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w600,
                                maxLines: 2,
                                padding: const EdgeInsets.only(bottom: 8),
                                alignment: Alignment.topLeft,
                                textColor: Colors.black),
                            MyText(item.description, fontSize: 12, fontFamily: 'SofiaSans', maxLines: 4, alignment: Alignment.topLeft, textColor: Colors.black),
                            MyText('Project Duration: ${item.projectDuration}',
                                fontWeight: FontWeight.bold,
                                padding: const EdgeInsets.only(top: 5),
                                fontSize: 12,
                                fontFamily: 'SofiaSans',
                                maxLines: 3,
                                alignment: Alignment.topLeft,
                                textColor: Colors.black),
                            MyText('Features: ${item.features}',
                                fontWeight: FontWeight.bold,
                                padding: const EdgeInsets.only(top: 2),
                                fontSize: 12,
                                fontFamily: 'SofiaSans',
                                maxLines: 3,
                                alignment: Alignment.topLeft,
                                textColor: Colors.black),
                            MyText('Platforms Used: ${item.projectPlatform}',
                                fontWeight: FontWeight.bold,
                                padding: const EdgeInsets.only(top: 2),
                                fontSize: 12,
                                fontFamily: 'SofiaSans',
                                maxLines: 3,
                                alignment: Alignment.topLeft,
                                textColor: Colors.black),
                          ],
                        ))
                  ])),
            ));
  }
}
