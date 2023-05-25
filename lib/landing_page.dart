import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_final_omar/ui/screens/about.dart';
import 'package:portfolio_final_omar/ui/screens/blog_details.dart';
import 'package:portfolio_final_omar/ui/screens/blogs.dart';
import 'package:portfolio_final_omar/ui/screens/contact.dart';
import 'package:portfolio_final_omar/ui/screens/home.dart';
import 'package:portfolio_final_omar/ui/screens/work_details.dart';
import 'package:portfolio_final_omar/ui/screens/works.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:portfolio_final_omar/utils/__screen.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__hover.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? pageName = Get.parameters['pageName'];
  String? pageData = Get.parameters['pageData'];
  bool showNavbar = GetPlatform.isMobile ? false : true;

  // final menuItems = ['home', 'about', 'works', 'blogs', 'contacts', 'works/:pageData', 'new/project'];
  // final pageItems = [const Home(), const About(), const Works(), const Works(), const Contact(), const WorkDetails(), const AddProject()];
  final menu = {
    'home': const Home(),
    'about': const About(),
    'works': const Works(),
    'blogs': const Blogs(),
    'contacts': const Contact(),
    'works/:pageData': const WorkDetails(),
    'blogs/:pageData': const BlogDetails(),
  };
  final menuItemTitles = ['Home', 'About Me', 'Works', 'Blogs', 'Contact me'];
  final adminMenuTiles = ['Add New Project', 'Add New Blog', 'Edit About', 'Edit Home'];
  final iconItems = [(Icons.home), (Icons.ac_unit), (Icons.access_time), Icons.screenshot, (Icons.add_circle_outlined)];

  @override
  Widget build(BuildContext context) {
    if (pageName != null) pageName = pageName!.toLowerCase();
    if (pageData != null) pageData = pageData!.toLowerCase();

    double width = Screen.isDesktop(context)
        ? Screen.width(context) * 0.20
        : Screen.isTablet(context)
            ? Screen.width(context) * 0.30
            : Screen.width(context);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Menu
              AnimatedScale(
                  duration: const Duration(milliseconds: 1000),
                  scale: showNavbar ? 1 : 0,
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      alignment: Alignment.center,
                      color: MyColors.primary,
                      height: double.infinity,
                      width: showNavbar ? width : 0,
                      child: SingleChildScrollView(
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                        InkWell(
                            onTap: () => Get.toNamed('/'),
                            child: const FittedBox(
                                child: MyText('@akaomarfahim',
                                    alignment: Alignment.centerLeft, textColor: MyColors.accent, fontFamily: 'SofiaSans', fontWeight: FontWeight.bold, fontSize: 24))),
                        const SizedBox(height: 90),
                        ListView.builder(
                            itemCount: menuItemTitles.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => menuItem(menuItemTitles.elementAt(index),
                                isSelected: (pageName == menu.keys.elementAt(index)) ? true : false,
                                iconData: iconItems[index],
                                onTap: () => Get.toNamed('/${menu.keys.elementAt(index)}')))
                      ])))),
              // Page shower
              // Expanded(child: IndexedStack(index: (pageData == null) ? menu.keys.where((element) => (element == pageName)) : menuItems.indexOf("$pageName/:pageData"), children: pageItems)),
              Expanded(
                  child: menu.keys.toList().contains(pageName)
                      ? IndexedStack(
                          index: (pageData == null)
                              ? menu.keys.toList().indexWhere((element) => (element == pageName))
                              : menu.keys.toList().indexWhere((element) => (element == '$pageName/:pageData')),
                          children: menu.values.toList())
                      : Container(
                          alignment: Alignment.center,
                          child: const MyText('404! Error \nPage Doesn\'t Exist :\') ', fontSize: 34),
                        )),
            ]),
            // Menu Icon Button
            IconButton(onPressed: () => setState(() => setState(() => showNavbar = !showNavbar)), icon: const Icon(Icons.menu, color: MyColors.accent)),
          ],
        ));
  }
}

menuItem(String label, {void Function()? onTap, IconData iconData = Icons.menu, bool isSelected = false}) => OnHover(builder: (isHovered) {
      final color = isHovered ? MyColors.accent : Colors.white;
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: InkWell(
              borderRadius: BorderRadius.circular(100),
              splashColor: Colors.amber,
              hoverColor: Colors.white12,
              onTap: onTap,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                scale: (isSelected || isHovered) ? 1.05 : 1,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white12
                            : isHovered
                                ? Colors.white24
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(children: [
                      Icon(iconData, size: 18, color: color),
                      const SizedBox(width: 10),
                      MyText(label,
                          fontSize: 14, textColor: color, alignment: Alignment.centerLeft, fontWeight: FontWeight.bold, maxLines: 1, letterSpacing: 1, fontFamily: 'SofiaSans')
                    ])),
              )));
    });
