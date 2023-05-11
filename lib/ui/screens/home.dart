import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__hover.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import '../../models/profile_model.dart';
import '../../utils/listtostring_stringtolist.dart';
import '../../widgets/widget_default/__button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoadingComplete = false;
  List<String> animatedTextList = ['Flutter Developer', 'Full-Stack Developer', 'Photography Lover', 'Dreamer'];
  late ProfileModel profile;

  @override
  void initState() {
    super.initState();
    ROOTMyText.alignment = Alignment.center;

    loadData();
  }

  loadData() async {
    if (mounted) setState(() => isLoadingComplete = false);
    log('INIT Firebase');

    profile = await ProfileModel.getData();
    if (profile.animatedTexts.isNotEmpty) {
      animatedTextList.clear();
      animatedTextList = await stringtoList(string: profile.animatedTexts, breaker: ',');
    }

    if (mounted) setState(() => isLoadingComplete = true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: !isLoadingComplete
            ? const SplashScreen()
            : Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('asset/images/matrix.gif', height: double.infinity, width: double.infinity, fit: BoxFit.cover),
                  Container(height: double.infinity, width: double.infinity, color: MyColors.primary.withOpacity(0.9)),
                  SingleChildScrollView(
                      // key: MyGlobalKey.homeKey,
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 70,
                          backgroundColor: MyColors.accent,
                          // backgroundImage: const ExactAssetImage('asset/images/avatar.png'),
                          child:
                              Padding(padding: const EdgeInsets.all(4), child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset('asset/images/avatar.png')))),
                      MyText(profile.name,
                          fontStyle: FontStyle.normal,
                          fontSize: 30,
                          margin: const EdgeInsets.only(top: 15),
                          textColor: Colors.white,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold),
                      MyText(profile.tagLine,
                          margin: const EdgeInsets.only(top: 10),
                          textStyleEnforcement: true,
                          textStyle: TextStyle(fontSize: 16, fontFamily: 'SofiaSans', fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, color: Colors.grey.shade100)),
                      const SizedBox(height: 20),
                      animatedTextAboutMe(),
                      const SizedBox(height: 20),
                      ScoialIconSection(profile: profile),
                      const SizedBox(height: 40),
                      Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 10,
                        spacing: 10,
                        children: [
                          // hireMeButton('View CV', () => launchUrl(Uri.parse(ROOT.cvUrlView))),
                          hireMeButton('Download resume', () => launchUrl(Uri.parse(profile.downloadCv))),
                          hireMeButton('Hire me', () => launchUrl(Uri.parse(profile.hireMe))),
                        ],
                      )
                    ],
                  ))
                ],
              ));
  }

  animatedTextAboutMe() {
    TextStyle textStyle =
        const TextStyle(fontFamily: 'Courier', fontSize: 18, fontStyle: FontStyle.normal, color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 0.4, wordSpacing: 2);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // myText('I\'m a ', fontsize: 16, fontWeight: FontWeight.normal, color: Colors.white),
        Text('I\'m a ', style: textStyle),
        AnimatedTextKit(
          animatedTexts: [
            for (int i = 0; i < animatedTextList.length; i++) ...[TypewriterAnimatedText(animatedTextList[i], textStyle: textStyle)]
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
            label: FittedBox(
              child: MyText(label,
                  maxLines: 1,
                  textStyleEnforcement: true,
                  textStyle: const TextStyle(fontSize: 13, color: Colors.black, fontFamily: 'RobotoSlab', fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            ),
            background: Colors.transparent,
            foreground: Colors.black,
            action: action,
          ),
          // child: MyButton(height: 40, width: 160, background: Colors.transparent, textStyle: const TextStyle(color: Colors.black), foreground: Colors.black, action: action),
        );
      });
}

class ScoialIconSection extends StatelessWidget {
  final ProfileModel profile;
  const ScoialIconSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Wrap(alignment: WrapAlignment.center, runAlignment: WrapAlignment.center, spacing: 0, children: [
      socialIcon(FontAwesomeIcons.linkedin, profile.linkdInLink),
      socialIcon(FontAwesomeIcons.github, profile.github),
      socialIcon(FontAwesomeIcons.squareFacebook, profile.facebook),
      socialIcon(FontAwesomeIcons.instagram, profile.instagram),
      socialIcon(FontAwesomeIcons.twitter, profile.twitter),
      socialIcon(FontAwesomeIcons.dribbble, profile.dribble),
      socialIcon(FontAwesomeIcons.pinterest, profile.pinterest),
      socialIcon(Icons.coffee, profile.coffee),
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
          icon: Icon(icon, size: 22)),
    );
