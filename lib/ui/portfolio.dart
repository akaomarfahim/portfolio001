import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/ui/screens/home.dart';
import 'package:portfolio_final_omar/ui/menu/menu.dart';
import 'package:portfolio_final_omar/ui/screens/services.dart';
import 'screens/about.dart';
import 'screens/experiences.dart';

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
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Navbar(scrollController: scrollController),
            Expanded(
                child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: const [
                        Home(),
                        About(),
                        Services(),
                        Experiences(),
                        // Home(homeKey: homeKey),
                      ],
                    )))
          ],
        ));
  }
}
