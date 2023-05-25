import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_final_omar/constants/root.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:portfolio_final_omar/models/blog_model.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import '../../backend/Firebase/firebase_backend.dart';
import '../../constants/def.dart';
import '../../utils/__screen.dart';
import '../../widgets/widget_default/__hover.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  bool isLoadingComplete = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    setState(() => isLoadingComplete = false);
    DatabaseReference ref = FirebaseAPI.connect.child('blogs');
    ref.onValue.listen((event) async {
      await BlogModel.getData();
      setState(() {});
    });

    setState(() => isLoadingComplete = true);
  }

  @override
  Widget build(BuildContext context) {
    return !isLoadingComplete
        ? const SplashScreen()
        : BlogModel.items.isEmpty
            ? const Center(child: MyText('Nothing to show', textColor: Colors.white, fontWeight: FontWeight.w500))
            : Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText('Recent Posts',
                          padding: EdgeInsets.fromLTRB(20, 30, 20, 15), alignment: Alignment.centerLeft, textColor: Colors.black87, fontSize: 24, fontWeight: FontWeight.w500),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              runAlignment: WrapAlignment.start,
                              spacing: 20,
                              runSpacing: 20,
                              children: BlogModel.items.map((e) => BlogItem(item: e)).toList().reversed.toList())),
                    ],
                  ),
                ),
              );
  }
}

class BlogItem extends StatelessWidget {
  final BlogModel item;
  const BlogItem({Key? key, required this.item}) : super(key: key);

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
        builder: (isHovered) => InkWell(
            onTap: () => Get.toNamed('/blogs/${item.key}'),
            child: SizedBox(
              width: width,
              child: Column(children: [
                Stack(clipBehavior: Clip.none, fit: StackFit.loose, alignment: Alignment.center, children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(Def.cardBorderRadius)),
                      child: Image.network(item.imageUrl ?? FirebaseDataRoot.imageErrorLink,
                          colorBlendMode: BlendMode.darken, color: Colors.black.withOpacity(0.2), fit: BoxFit.cover, height: height, width: width)),
                  Positioned(
                      top: 0,
                      left: 20,
                      child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.yellow.shade700,
                              boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 1, color: Colors.black38, offset: Offset.fromDirection(1, 2))],
                              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(Def.cardBorderRadius))),
                          child: MyText(item.category,
                              textStyleEnforcement: true,
                              alignment: Alignment.center,
                              textAlign: TextAlign.center,
                              textStyle: const TextStyle(fontFamily: 'SofiaSans', fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              maxLines: 1)))
                ]),
                Container(
                    width: width,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(bottom: Radius.circular(Def.cardBorderRadius))),
                    child: Column(
                      children: [
                        MyText(item.title,
                            textStyleEnforcement: true,
                            textStyle: const TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.w600, color: Colors.black),
                            padding: const EdgeInsets.only(bottom: 4),
                            alignment: Alignment.topLeft),
                        MyText('${item.publisedDate} | ${item.author}',
                            textStyleEnforcement: true,
                            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, fontFamily: 'SofiaSans', color: Colors.grey.shade700),
                            padding: const EdgeInsets.only(top: 5),
                            maxLines: 4,
                            alignment: Alignment.topLeft),
                      ],
                    ))
              ]),
            )));
  }
}
