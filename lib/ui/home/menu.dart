import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/ui/home/portfolio.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__hover.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:provider/provider.dart';
import '../../constants/menu.dart';
import '../../providers/screen_provider.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    selectedIndex = context.watch<ScreenProvider>().selectedPageIndex;
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Portfolio())),
            child: FittedBox(
                child: myText('@akaomarfahim', alignment: Alignment.centerLeft, color: MyColors.accent, fontFamily: 'SofiaSans', fontWeight: FontWeight.bold, fontsize: 24))),
        const SizedBox(height: 70),
        ListView.builder(
            itemCount: menu.length,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                menuItem(menu.keys.elementAt(index), selected: (selectedIndex == index) ? true : false, iconData: menu.entries.elementAt(index).value, onTap: () {
                  context.read<ScreenProvider>().setIndex(index);
                  context.read<ScreenProvider>().setMenuVisible(false);
                }))
      ],
    ));
  }

  // menuItem(String label, {void Function()? onTap, IconData iconData = Icons.menu, bool selected = false}) => OnHover(builder: (isHovered) {
  //       final color = isHovered ? MyColors.accent : Colors.white;
  //       return Container(
  //           margin: const EdgeInsets.symmetric(vertical: 2),
  //           child: ListTile(
  //               onTap: onTap,
  //               dense: true,
  //               splashColor: Colors.amber,
  //               hoverColor: Colors.white12,
  //               shape: const StadiumBorder(),
  //               selected: selected,
  //               selectedTileColor: Colors.white12,
  //               leading: Icon(iconData, size: 18, color: color),
  //               minLeadingWidth: 0,
  //               title: myText(label,
  //                   fontsize: 14, color: color, alignment: Alignment.centerLeft, fontWeight: FontWeight.bold, maxLines: 1, letterSpacing: 1, fontFamily: 'SofiaSans')));
  //     });

  menuItem(String label, {void Function()? onTap, IconData iconData = Icons.menu, bool selected = false}) => OnHover(builder: (isHovered) {
        final color = isHovered ? MyColors.accent : Colors.white;
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: InkWell(
                borderRadius: BorderRadius.circular(100),
                splashColor: Colors.amber,
                hoverColor: Colors.white12,
                onTap: onTap,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: selected ? Colors.white12 : Colors.transparent, borderRadius: BorderRadius.circular(100)),
                    child: Row(children: [
                      Icon(iconData, size: 18, color: color),
                      const SizedBox(width: 10),
                      myText(label,
                          fontsize: 14, color: color, alignment: Alignment.centerLeft, fontWeight: FontWeight.bold, maxLines: 1, letterSpacing: 1, fontFamily: 'SofiaSans'),
                    ]))));
      });
}
