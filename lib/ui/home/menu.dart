// import 'package:flutter/material.dart';
// import 'package:portfolio_final_omar/ui/home/portfolio.dart';
// import 'package:portfolio_final_omar/utils/__colors.dart';
// import 'package:portfolio_final_omar/utils/__screen.dart';
// import 'package:portfolio_final_omar/widgets/widget_default/__hover.dart';
// import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
// import 'package:provider/provider.dart';
// import '../../constants/menu_items.dart';
// import '../../providers/screen_provider.dart';

// class Navbar extends StatefulWidget {
//   const Navbar({super.key});

//   @override
//   State<Navbar> createState() => _NavbarState();
// }

// class _NavbarState extends State<Navbar> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     selectedIndex = context.watch<ScreenProvider>().selectedPageIndex;
//     return SingleChildScrollView(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         InkWell(
//             onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Portfolio())),
//             child: FittedBox(
//                 child: MyText('@akaomarfahim', alignment: Alignment.centerLeft, textColor: MyColors.accent, fontFamily: 'SofiaSans', fontWeight: FontWeight.bold, fontSize: 24))),
//         const SizedBox(height: 70),
//         ListView.builder(
//             itemCount: menu.length,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) =>
//                 menuItem(menu.keys.elementAt(index), selected: (selectedIndex == index) ? true : false, iconData: menu.entries.elementAt(index).value, onTap: () {
//                   context.read<ScreenProvider>().setIndex(index);
//                   Screen.isDesktop(context) ? context.read<ScreenProvider>().setMenuVisible(true) : context.read<ScreenProvider>().setMenuVisible(false);
//                   Navigator.pushNamed(context, '/${ScreenProvider.pages[index]}');
//                 }))
//       ],
//     ));
//   }

//   menuItem(String label, {void Function()? onTap, IconData iconData = Icons.menu, bool selected = false}) => OnHover(builder: (isHovered) {
//         final color = isHovered ? MyColors.accent : Colors.white;
//         return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 3),
//             child: InkWell(
//                 borderRadius: BorderRadius.circular(100),
//                 splashColor: Colors.amber,
//                 hoverColor: Colors.white12,
//                 onTap: onTap,
//                 child: Container(
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(color: selected ? Colors.white12 : Colors.transparent, borderRadius: BorderRadius.circular(100)),
//                     child: Row(children: [
//                       Icon(iconData, size: 18, color: color),
//                       const SizedBox(width: 10),
//                       MyText(label,
//                           fontSize: 14, textColor: color, alignment: Alignment.centerLeft, fontWeight: FontWeight.bold, maxLines: 1, letterSpacing: 1, fontFamily: 'SofiaSans'),
//                     ]))));
//       });
// }
