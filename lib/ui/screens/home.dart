import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/root.dart';
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
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        // key: MyGlobalKey.homeKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50,
                backgroundColor: MyColors.accent,
                // backgroundImage: const ExactAssetImage('asset/images/avatar.png'),
                child: Padding(padding: const EdgeInsets.all(4), child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset('asset/images/avatar.png')))),
            const SizedBox(height: 10),
            myText('OMAR FAHIM', fontsize: 20, fontFamily: 'Rubik', fontWeight: FontWeight.bold, color: Colors.white),
            myText(
              'Full-Stack Flutter Developer',
              padding: const EdgeInsets.symmetric(vertical: 10),
              fontsize: 12,
              fontFamily: 'SofiaSans',
              fontWeight: FontWeight.normal,
              color: Colors.grey.shade200,
            ),
            const SizedBox(height: 10),
            animatedTextAboutMe(),
            const SizedBox(height: 20),
            const ScoialIconSection(),
            const SizedBox(height: 40),
            Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 10,
              spacing: 10,
              children: [
                // hireMeButton('View CV', () => launchUrl(Uri.parse(ROOT.cvUrlView))),
                hireMeButton('Download CV', () => launchUrl(Uri.parse(ROOT.cvUrlDownload))),
                hireMeButton('Hire me', () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  animatedTextAboutMe() {
    TextStyle textStyle = const TextStyle(fontFamily: 'Rubik', color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 0.6, wordSpacing: 2);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // myText('I\'m a ', fontsize: 16, fontWeight: FontWeight.normal, color: Colors.white),
        Text('I\'m a ', style: textStyle),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('Flutter Developer', textStyle: textStyle),
            TypewriterAnimatedText('Full-Stack Developer', textStyle: textStyle),
            TypewriterAnimatedText('Photography Lover', textStyle: textStyle),
            TypewriterAnimatedText('Dreamer', textStyle: textStyle),
          ],
          displayFullTextOnTap: true,
          isRepeatingAnimation: true,
          repeatForever: true,
        )
      ],
    );
  }

  hireMeButton(String label, void Function()? action) => OnHover(builder: (isHovered) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            clipBehavior: Clip.hardEdge,
            curve: Curves.linear,
            transform: isHovered ? (Matrix4.identity()) : Matrix4.identity(),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(isHovered ? 20 : 4), color: isHovered ? Colors.white : MyColors.accent),
            transformAlignment: Alignment.center,
            child: myButton(
              width: 160,
              height: 40,
              splashFactory: InkSparkle.splashFactory,
              shape: const StadiumBorder(),
              label: myText(label, fontsize: 13, fontFamily: 'Rubkic', fontWeight: FontWeight.bold),
              background: Colors.transparent,
              foreground: Colors.black,
              action: action,
            ));
      });
}

class ScoialIconSection extends StatelessWidget {
  const ScoialIconSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(alignment: WrapAlignment.center, runAlignment: WrapAlignment.center, spacing: 0, children: [
      socialIcon(FontAwesomeIcons.linkedin, 'http://facebook.com/omarfahimofficial'),
      socialIcon(FontAwesomeIcons.github, 'https://github.com/akaomarfahim'),
      socialIcon(FontAwesomeIcons.squareFacebook, 'http://facebook.com/omarfahimofficial'),
      socialIcon(FontAwesomeIcons.twitter, 'http://facebook.com/omarfahimofficial'),
      socialIcon(FontAwesomeIcons.dribbble, 'http://facebook.com/omarfahimofficial'),
      socialIcon(FontAwesomeIcons.pinterest, 'http://facebook.com/omarfahimofficial'),
      socialIcon(FontAwesomeIcons.squareBehance, 'http://facebook.com/omarfahimofficial'),
    ]);
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
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          icon: Icon(icon, size: 18)),
    );
