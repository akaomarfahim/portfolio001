// import 'package:flutter/material.dart';
// import 'package:portfolio_final_omar/providers/screen_provider.dart';
// import 'package:portfolio_final_omar/utils/__colors.dart';
// import 'package:provider/provider.dart';
// import '../../utils/__screen.dart';
// import 'menu.dart';

// class Portfolio extends StatefulWidget {
//   final String page;
//   const Portfolio({super.key, this.page = '/'});

//   @override
//   State<Portfolio> createState() => _PortfolioState();
// }

// class _PortfolioState extends State<Portfolio> {
//   final ScrollController scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Theme.of(context).primaryColor, body: PortfolioDesktop(isDesktop: Screen.isDesktop(context), page: widget.page));
//   }
// }

// class PortfolioDesktop extends StatefulWidget {
//   final String page;
//   final bool isDesktop;
//   const PortfolioDesktop({super.key, required this.isDesktop, required this.page});

//   @override
//   State<PortfolioDesktop> createState() => _PortfolioDesktopState();
// }

// class _PortfolioDesktopState extends State<PortfolioDesktop> {
//   bool showNavBar = false;

//   @override
//   void initState() {
//     super.initState();
//     context.read<ScreenProvider>().setMenuVisible(!widget.isDesktop ? false : true);
//   }

//   List<String> pages = [
//     '/',
//     '/portfolio',
//     '/home',
//     '/about',
//     '/login',
//     '/admin',
//     '/new/project',
//     '/new/blog',
//     '/worklist',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     showNavBar = context.watch<ScreenProvider>().menuVisibleState;
//     double width = Screen.isDesktop(context)
//         ? Screen.width(context) * 0.20
//         : Screen.isTablet(context)
//             ? Screen.width(context) * 0.30
//             : Screen.width(context);
//     return Stack(children: [
//       Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           AnimatedScale(
//               duration: const Duration(milliseconds: 600),
//               scale: context.watch<ScreenProvider>().menuVisibleState ? 1 : 0,
//               alignment: Alignment.center,
//               child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 600),
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//                   alignment: Alignment.center,
//                   // width: showNavBar ? Screen.width(context) * 0.20 : 0,
//                   width: showNavBar ? width : 0,
//                   child: AnimatedOpacity(duration: const Duration(milliseconds: 450), opacity: showNavBar ? 1 : 0, child: const Navbar()))),
//           // Expanded(child: context.watch<ScreenProvider>().page)
//           Expanded(
//               child: IndexedStack(
//             index: pages.indexOf(widget.page),
//             children: ScreenProvider.pages,
//           ))
//         ],
//       ),
//       IconButton(onPressed: () => setState(() => context.read<ScreenProvider>().setMenuVisible(!showNavBar)), icon: const Icon(Icons.menu, color: MyColors.accent)),
//     ]);
//   }
// }
