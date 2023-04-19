import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/global_keys.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__hover.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';

import '../../constants/screen.dart';

class Navbar extends StatefulWidget {
  final ScrollController scrollController;
  const Navbar({super.key, required this.scrollController});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;

  void scrollToWidgetByKey(GlobalKey key) {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.fromDirection(1.0)); //this is global position
    double y = position.dy;
    widget.scrollController.animateTo(y, duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: Screen.width(context) * 0.30,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            myText('OMAR FAHIM.',
                alignment: Alignment.centerLeft, fontsize: Screen.width(context) * 0.036, color: MyColors.accent, fontFamily: 'SofiaSans', fontWeight: FontWeight.bold),
            const SizedBox(height: 100),
            ListView.builder(
                itemCount: MenuItemModel.items.length,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    menuItem(MenuItemModel.items[index].label ?? '', selected: (selectedIndex == index) ? true : false, iconData: CupertinoIcons.home, onTap: () {
                      if (mounted) setState(() => selectedIndex = index);
                      scrollToWidgetByKey(MenuItemModel.items[index].globalKey ?? MyGlobalKey.homeKey);
                    }))
          ],
        ),
      ),
    );
  }

  menuItem(String label, {void Function()? onTap, IconData iconData = Icons.menu, bool selected = false}) => OnHover(
        builder: (isHovered) {
          final color = isHovered ? MyColors.accent : Colors.white;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: ListTile(
              onTap: onTap,
              dense: true,
              // hoverColor: Colors.red,
              splashColor: Colors.amber,
              hoverColor: Colors.white12,
              shape: const StadiumBorder(),
              // focusColor: Colors.green,
              selected: selected,
              // selectedColor: Colors.red,
              selectedTileColor: Colors.white12,
              leading: Icon(iconData, size: 18, color: color),
              minLeadingWidth: 0,
              title: myText(
                label,
                fontsize: 14,
                color: color,
                alignment: Alignment.centerLeft,
                fontWeight: FontWeight.bold,
                maxLines: 1,
                letterSpacing: 1,
                fontFamily: 'SofiaSans',
              ),
            ),
          );
        },
      );
}



// menuItem(String label) => ListTile(
//     leading: const Icon(Icons.home),
//     title: OnHover(builder: (isHovered) {
//       final color = isHovered ? Colors.white : MyColors.accent;
//       return PhysicalModel(
//         color: Colors.blue,
//         elevation: isHovered ? 16 : 0, // if ishovered true then show elevation on hovering
//         child: SizedBox(
//           width: 100,
//           height: 100,
//         ),
//       );
//     }));



            // menuItem('HOME', iconData: CupertinoIcons.home, onTap: () => scrollToWidgetByKey(MyGlobalKey.homeKey)),
            // menuItem('About', iconData: CupertinoIcons.person, onTap: () => scrollToWidgetByKey(MyGlobalKey.aboutKey)),
            // menuItem('Services', iconData: CupertinoIcons.waveform, onTap: () => scrollToWidgetByKey(MyGlobalKey.servicesKey)),
            // menuItem('Experience', iconData: CupertinoIcons.rectangle_expand_vertical, onTap: () => scrollToWidgetByKey(MyGlobalKey.experienceKey)),
            // menuItem('Works', iconData: CupertinoIcons.phone, onTap: () {}),
            // menuItem('Blogs', iconData: CupertinoIcons.phone, onTap: () {}),
            // menuItem('Contact', iconData: CupertinoIcons.phone, onTap: () {}),