import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__loadings.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/__screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 2), () {
    //   Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const Portfolio()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myText('Welcome'),
              const SizedBox(height: 10),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: context.isMobile ? Screen.width(context) * 0.80 : Screen.width(context) * 0.40,
                child: myLinearLoader(),
              )
            ],
          )),
    );
  }
}
