import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/providers/screen_provider.dart';
import 'package:portfolio_final_omar/ui/home/menu.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/__screen.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ScreenTypeLayout.builder(
          desktop: (context) => const SelectionArea(child: PortfolioDesktop()),
          tablet: (context) => const PortfolioTablet(),
          mobile: (context) => const PortfolioMobile(),
        ));
  }
}

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({super.key});

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  bool showNavBar = true;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
              duration: const Duration(milliseconds: 600),
              scale: showNavBar ? 1 : 0,
              alignment: Alignment.center,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  alignment: Alignment.center,
                  width: showNavBar ? Screen.width(context) * 0.20 : 0,
                  child: AnimatedOpacity(duration: const Duration(milliseconds: 450), opacity: showNavBar ? 1 : 0, child: const Navbar()))),
          Expanded(child: context.watch<ScreenProvider>().page)
        ],
      ),
      IconButton(onPressed: () => setState(() => showNavBar = !showNavBar), icon: const Icon(Icons.menu, color: MyColors.accent)),
    ]);
  }
}

class PortfolioTablet extends StatefulWidget {
  const PortfolioTablet({super.key});

  @override
  State<PortfolioTablet> createState() => _PortfolioTabletState();
}

class _PortfolioTabletState extends State<PortfolioTablet> {
  bool showNavBar = true;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
              duration: const Duration(milliseconds: 600),
              scale: showNavBar ? 1 : 0,
              alignment: Alignment.center,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  alignment: Alignment.center,
                  width: showNavBar ? Screen.width(context) * 0.30 : 0,
                  child: AnimatedOpacity(duration: const Duration(milliseconds: 450), opacity: showNavBar ? 1 : 0, child: const Navbar()))),
          Expanded(child: context.watch<ScreenProvider>().page)
        ],
      ),
      IconButton(onPressed: () => setState(() => showNavBar = !showNavBar), icon: const Icon(Icons.menu, color: MyColors.accent)),
    ]);
  }
}

class PortfolioMobile extends StatefulWidget {
  const PortfolioMobile({super.key});

  @override
  State<PortfolioMobile> createState() => _PortfolioMobileState();
}

class _PortfolioMobileState extends State<PortfolioMobile> {
  bool showNavBar = false;

  @override
  Widget build(BuildContext context) {
    showNavBar = context.watch<ScreenProvider>().menuVisibleState;
    return Stack(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showNavBar)
            AnimatedScale(
                duration: const Duration(milliseconds: 600),
                scale: showNavBar ? 1 : 0,
                alignment: Alignment.center,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    alignment: Alignment.center,
                    width: Screen.width(context),
                    // width: showNavBar ? Screen.width(context) * 0.20 : 0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 450),
                      opacity: showNavBar ? 1 : 0,
                      child: const Navbar(),
                    ))),
          if (!showNavBar) Expanded(child: context.watch<ScreenProvider>().page)
        ],
      ),
      IconButton(onPressed: () => setState(() => context.read<ScreenProvider>().setMenuVisible(!showNavBar)), icon: const Icon(Icons.menu, color: MyColors.accent)),
    ]);
  }
}
