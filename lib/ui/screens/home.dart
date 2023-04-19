import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/global_keys.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__hover.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../widgets/widget_default/__button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        key: MyGlobalKey.homeKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 60,
                backgroundColor: MyColors.accent,
                // backgroundImage: const ExactAssetImage('asset/images/avatar.png'),
                child: Padding(padding: const EdgeInsets.all(6), child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset('asset/images/avatar.png')))),
            const SizedBox(height: 10),
            myText('OMAR FAHIM', fontsize: 20, fontFamily: 'Rubik', fontWeight: FontWeight.bold, color: Colors.white),
            const SizedBox(height: 40),
            animatedTextAboutMe(),
            const SizedBox(height: 40),
            const ScoialIconSection(),
            const SizedBox(height: 40),
            OnHover(builder: (isHovered) {
              return AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  clipBehavior: Clip.hardEdge,
                  curve: Curves.linear,
                  transform: isHovered ? (Matrix4.identity()..scale(1.1)) : Matrix4.identity(),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(isHovered ? 20 : 4), color: isHovered ? Colors.white : MyColors.accent),
                  transformAlignment: Alignment.center,
                  child: myButton(
                    width: 100,
                    height: 30,
                    // elevation: isHovered ? 6 : 0,
                    // shadowColor: Colors.black,
                    splashFactory: InkSparkle.splashFactory,

                    shape: const StadiumBorder(),
                    label: myText('Hire Me', fontsize: 13, fontFamily: 'Rubkic', fontWeight: FontWeight.w500),
                    // background: isHovered ? Colors.white : MyColors.accent,
                    background: Colors.transparent,
                    foreground: Colors.black,
                    action: () {},
                  ));
            })
          ],
        ),
      ),
    );
  }

  animatedTextAboutMe() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // myText('I\'m a ', fontsize: 16, fontWeight: FontWeight.normal, color: Colors.white),
          const Text('I\'m a ', style: TextStyle(color: Colors.white)),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Flutter Developer', textStyle: const TextStyle(color: Colors.white)),
              TypewriterAnimatedText('Full-Stack Developer', textStyle: const TextStyle(color: Colors.white)),
              TypewriterAnimatedText('Photography Lover', textStyle: const TextStyle(color: Colors.white)),
              TypewriterAnimatedText('Dreamer', textStyle: const TextStyle(color: Colors.white)),
            ],
            displayFullTextOnTap: true,
            isRepeatingAnimation: true,
            repeatForever: true,
          )
        ],
      );
}

class ScoialIconSection extends StatefulWidget {
  const ScoialIconSection({super.key});

  @override
  State<ScoialIconSection> createState() => _ScoialIconSectionState();
}

class _ScoialIconSectionState extends State<ScoialIconSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 0,
        children: [
          socialIcon(FontAwesomeIcons.linkedin, 'http://facebook.com/omarfahimofficial'),
          socialIcon(FontAwesomeIcons.github, 'http://facebook.com/omarfahimofficial'),
          socialIcon(FontAwesomeIcons.squareFacebook, 'http://facebook.com/omarfahimofficial'),
          socialIcon(FontAwesomeIcons.twitter, 'http://facebook.com/omarfahimofficial'),
          socialIcon(FontAwesomeIcons.dribbble, 'http://facebook.com/omarfahimofficial'),
          // socialIcon(FontAwesomeIcons.pinterest, 'http://facebook.com/omarfahimofficial'),
          // socialIcon(FontAwesomeIcons.squareBehance, 'http://facebook.com/omarfahimofficial'),
        ],
      ),
    );
  }
}

socialIcon(IconData icon, String url) => OnHover(
      builder: (isHovered) => IconButton(
          onPressed: () => launchUrl(Uri.parse(url)),
          alignment: Alignment.center,
          splashColor: MyColors.accent,
          color: isHovered ? MyColors.accent : Colors.white,
          // hoverColor: MyColors.accent.withOpacity(0.6),
          visualDensity: VisualDensity.compact,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          icon: Icon(icon, size: 22)),
    );
