import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/menu.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__hover.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:provider/provider.dart';
import '../../constants/screen.dart';
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
        myText(
          '@akaomarfahim',
          alignment: Alignment.centerLeft,
          fontsize: Screen.width(context) * 0.032,
          color: MyColors.accent,
          fontFamily: 'SofiaSans',
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 100),
        ListView.builder(
            itemCount: menu.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => menuItem(menu.keys.elementAt(index),
                selected: (selectedIndex == index) ? true : false, iconData: menu.entries.elementAt(index).value, onTap: () => context.read<ScreenProvider>().setIndex(index)))
      ],
    ));
  }

  menuItem(String label, {void Function()? onTap, IconData iconData = Icons.menu, bool selected = false}) => OnHover(builder: (isHovered) {
        final color = isHovered ? MyColors.accent : Colors.white;
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: ListTile(
                onTap: onTap,
                dense: true,
                splashColor: Colors.amber,
                hoverColor: Colors.white12,
                shape: const StadiumBorder(),
                selected: selected,
                selectedTileColor: Colors.white12,
                leading: Icon(iconData, size: 18, color: color),
                minLeadingWidth: 0,
                title: myText(label,
                    fontsize: 14, color: color, alignment: Alignment.centerLeft, fontWeight: FontWeight.bold, maxLines: 1, letterSpacing: 1, fontFamily: 'SofiaSans')));
      });
}
