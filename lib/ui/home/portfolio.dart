import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/providers/screen_provider.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:provider/provider.dart';

import '../../constants/screen.dart';
import 'menu.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  bool showNavBar = true;
  bool navBarVisible = true;

  @override
  void initState() {
    super.initState();
  }

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(children: [
          IconButton(
              onPressed: () => setState(() {
                    showNavBar = !showNavBar;
                  }),
              icon: const Icon(Icons.menu, color: MyColors.accent)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedScale(
                  duration: const Duration(milliseconds: 600),
                  scale: showNavBar ? 1 : 0,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      alignment: Alignment.center,
                      width: showNavBar ? Screen.width(context) * 0.30 : 100,
                      height: MediaQuery.of(context).size.height,
                      onEnd: () => setState(() => navBarVisible = showNavBar),
                      child: AnimatedOpacity(duration: const Duration(milliseconds: 450), opacity: showNavBar ? 1 : 0, child: const Navbar()))),
              Expanded(child: context.watch<ScreenProvider>().page)
            ],
          ),
        ]));
  }
}
