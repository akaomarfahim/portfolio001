import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/ui/screens/home.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';

import '../ui/screens/about.dart';
import '../ui/screens/works.dart';

class ScreenProvider with ChangeNotifier {
  int selectedPageIndex = 0;
  Widget page = const Home();

  static List<Widget> pages = [
    const Home(),
    const About(),
    const About(),
    const About(),
    const Works(),
  ];

  setPage(Widget widget) {
    page = widget;
    notifyListeners();
  }

  reset() => setPage(pages[selectedPageIndex]);

  setIndex(int index) {
    selectedPageIndex = index;
    page = (index < pages.length) ? pages[index] : Container(child: myText('Under Development'));
    notifyListeners();
  }
}
