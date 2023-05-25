import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/models/education_model.dart';
import 'package:portfolio_final_omar/models/profile_model.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:portfolio_final_omar/utils/listtostring_stringtolist.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__hover.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/__colors.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  double radius = 10;
  EdgeInsets padding = const EdgeInsets.fromLTRB(40, 0, 40, 10);
  bool isLoadingComplete = false;
  late ProfileModel profile;
  List<String> programmingSkills = [];
  List<String> otherSkills = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    if (mounted) setState(() => isLoadingComplete = false);
    profile = await ProfileModel.getData();
    await EducationModel.getData();
    programmingSkills = await stringtoList(string: profile.programmingSkills, breaker: ', ');
    otherSkills = await stringtoList(string: profile.otherSkills, breaker: ', ');
    if (mounted) setState(() => isLoadingComplete = true);
  }

  @override
  Widget build(BuildContext context) {
    padding = context.isMobile ? const EdgeInsets.fromLTRB(10, 0, 5, 10) : const EdgeInsets.fromLTRB(40, 0, 40, 10);
    return !isLoadingComplete
        ? const SplashScreen()
        : Container(
            color: Colors.grey.shade300,
            height: double.infinity,
            width: double.infinity,
            // padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText('About Me',
                    margin: const EdgeInsets.only(top: 40, left: 10),
                    padding: padding,
                    alignment: Alignment.centerLeft,
                    textStyleEnforcement: true,
                    textStyle: const TextStyle(color: MyColors.primary, fontFamily: 'Rubik', fontSize: 24, fontWeight: FontWeight.w800)),
                context.isMobile ? aboutHeaderMobile() : aboutHeaderDesktop(),
                programmingSkillsCard(),
                workExperiencesCard(),
                if (EducationModel.items.isNotEmpty)
                  Card(
                      margin: padding,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                      child: Column(
                        children: [
                          const MyText('Education',
                              alignment: Alignment.centerLeft,
                              fontFamily: 'Rubik',
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              textColor: Colors.redAccent,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          const Divider(color: Colors.redAccent, indent: 20, endIndent: 40, height: 10, thickness: 0.4),
                          ListView.builder(
                              shrinkWrap: true,
                              reverse: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: EducationModel.items.length,
                              itemBuilder: (context, index) => educationTile(EducationModel.items[index])),
                          const SizedBox(height: 10)
                        ],
                      )),
                if (EducationModel.experieces.isNotEmpty)
                  Card(
                      margin: padding,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                      child: Column(
                        children: [
                          const MyText('Experiences',
                              alignment: Alignment.centerLeft,
                              fontFamily: 'Rubik',
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              textColor: Colors.redAccent,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          const Divider(color: Colors.redAccent, indent: 20, endIndent: 40, height: 10, thickness: 0.4),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: EducationModel.experieces.length,
                              reverse: true,
                              itemBuilder: (context, index) => experienceTile(EducationModel.experieces[index])),
                          const SizedBox(height: 20),
                        ],
                      )),
                Card(
                    margin: padding,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                    child: Column(
                      children: [
                        const MyText('Self-Evaluation',
                            alignment: Alignment.centerLeft,
                            fontFamily: 'Rubik',
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            textColor: Colors.redAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        const Divider(color: Colors.redAccent, indent: 20, endIndent: 40, height: 10, thickness: 0.4),
                        MyText(profile.selfEvaluation,
                            fontFamily: 'SofiaSans',
                            padding: const EdgeInsets.fromLTRB(22, 10, 0, 40),
                            alignment: Alignment.centerLeft,
                            textColor: MyColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ],
                    )),
                const SizedBox(height: 10),
              ],
            )));
  }

  programmingSkillsCard() => Card(
        margin: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyText('Programming Skills',
                alignment: Alignment.centerLeft,
                fontFamily: 'Rubik',
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                textColor: Colors.redAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold),
            const Divider(color: Colors.redAccent, indent: 20, endIndent: 40, height: 10, thickness: 0.4),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Wrap(
                runSpacing: 10,
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: [
                  for (int i = 0; i < programmingSkills.length; i++) ...[
                    skillsTile(programmingSkills[i]),
                  ]
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );

  workExperiencesCard() => Card(
        margin: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyText('Other Skills',
                alignment: Alignment.centerLeft,
                fontFamily: 'Rubik',
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                textColor: Colors.redAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold),
            const Divider(color: Colors.redAccent, indent: 20, endIndent: 40, height: 10, thickness: 0.4),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Wrap(
                runSpacing: 10,
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: [
                  for (int i = 0; i < otherSkills.length; i++) ...[
                    skillsTile(otherSkills[i]),
                  ]
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );

  aboutHeaderDesktop() => Container(
        height: 550,
        padding: padding,
        child: Row(children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(radius), bottom: Radius.circular(radius))),
            child: Container(
                width: 220,
                padding: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(radius), bottom: Radius.circular(radius))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.vertical(bottom: const Radius.circular(10), top: Radius.circular(radius)),
                        child: Image.asset('asset/images/avatar.png', fit: BoxFit.contain)),
                    const SizedBox(height: 6),
                    const MyText('E-mail',
                        textStyleEnforcement: true,
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'SofiaSans', color: Colors.black),
                        padding: EdgeInsets.only(bottom: 2)),
                    FittedBox(
                        child: MyText(profile.email,
                            fontSize: 24,
                            margin: const EdgeInsets.only(bottom: 14),
                            fontFamily: 'SofiaSans',
                            fontStyle: FontStyle.italic,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            textColor: Colors.black)),
                    const MyText('Phone',
                        textStyleEnforcement: true, textStyle: TextStyle(fontSize: 16, fontFamily: 'SofiaSans', color: Colors.black), padding: EdgeInsets.only(bottom: 2)),
                    FittedBox(
                        child: MyText(profile.phone,
                            margin: const EdgeInsets.only(bottom: 14), fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), textColor: Colors.black)),
                    const MyText('Website',
                        textStyleEnforcement: true, textStyle: TextStyle(fontSize: 16, fontFamily: 'SofiaSans', color: Colors.black), padding: EdgeInsets.only(bottom: 2)),
                    FittedBox(
                        child: MyText(profile.website,
                            maxLines: 2,
                            margin: const EdgeInsets.only(bottom: 14),
                            fontFamily: 'SofiaSans',
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            textColor: Colors.black)),
                    const MyText('Address',
                        textStyleEnforcement: true, textStyle: TextStyle(fontSize: 16, fontFamily: 'SofiaSans', color: Colors.black), padding: EdgeInsets.only(bottom: 2)),
                    FittedBox(
                        child: MyText(profile.address,
                            margin: EdgeInsets.zero, fontSize: 12, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), textColor: Colors.black)),
                    MyButton(
                        action: () => launchUrl(Uri.parse(profile.downloadCv)),
                        label: 'Download resume',
                        height: 50,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        shape: const StadiumBorder(),
                        background: Colors.yellow.shade700,
                        foreground: Colors.black87,
                        borderColor: Colors.black38),
                  ],
                )),
          ),
          Expanded(
            child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                child: SingleChildScrollView(
                  child: Column(children: [
                    MyText(profile.fullName,
                        alignment: Alignment.centerLeft,
                        fontFamily: 'Rubik',
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        textColor: Colors.redAccent,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                    const Divider(
                      color: Colors.redAccent,
                      indent: 20,
                      height: 10,
                      endIndent: 40,
                      thickness: 0.6,
                    ),
                    MyText(profile.introLine,
                        fontFamily: 'Courier',
                        padding: const EdgeInsets.fromLTRB(22, 0, 0, 10),
                        alignment: Alignment.centerLeft,
                        textColor: MyColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                    MyText(profile.bio,
                        fontFamily: 'SofiaSans',
                        padding: const EdgeInsets.fromLTRB(22, 0, 30, 20),
                        alignment: Alignment.centerLeft,
                        textColor: MyColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    MyText('Language Speak: ${profile.languages}',
                        fontFamily: 'Rubik',
                        padding: const EdgeInsets.fromLTRB(22, 0, 0, 10),
                        alignment: Alignment.centerLeft,
                        textColor: MyColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    const SizedBox(height: 20),
                  ]),
                )),
          )
        ]),
      );

  aboutHeaderMobile() => Column(children: [
        Card(
          margin: padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(radius), bottom: Radius.circular(radius))),
          child: Container(
              // width: 220,
              padding: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(radius), bottom: Radius.circular(radius))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.vertical(bottom: const Radius.circular(10), top: Radius.circular(radius)),
                      child: Image.asset('asset/images/avatar.png', fit: BoxFit.contain)),
                  const SizedBox(height: 6),
                  const MyText('e-mail',
                      textStyleEnforcement: true,
                      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'SofiaSans', color: Colors.black),
                      padding: EdgeInsets.only(bottom: 2, top: 6)),
                  FittedBox(
                      child: MyText(profile.email,
                          fontSize: 20,
                          margin: const EdgeInsets.only(bottom: 14),
                          fontFamily: 'SofiaSans',
                          fontStyle: FontStyle.italic,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          textColor: Colors.black)),
                  const MyText('Phone',
                      textStyleEnforcement: true, textStyle: TextStyle(fontSize: 20, fontFamily: 'SofiaSans', color: Colors.black), padding: EdgeInsets.only(bottom: 2)),
                  FittedBox(
                      child: MyText(profile.phone,
                          fontSize: 20,
                          margin: const EdgeInsets.only(bottom: 14),
                          fontFamily: 'SofiaSans',
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          textColor: Colors.black)),
                  const MyText('Website',
                      textStyleEnforcement: true, textStyle: TextStyle(fontSize: 16, fontFamily: 'SofiaSans', color: Colors.black), padding: EdgeInsets.only(bottom: 2)),
                  FittedBox(
                      child: MyText(profile.website,
                          fontSize: 16,
                          margin: const EdgeInsets.only(bottom: 14),
                          fontFamily: 'SofiaSans',
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          textColor: Colors.black)),
                  const MyText('Address',
                      textStyleEnforcement: true, textStyle: TextStyle(fontSize: 16, fontFamily: 'SofiaSans', color: Colors.black), padding: EdgeInsets.only(bottom: 2)),
                  FittedBox(
                      child: MyText(profile.address,
                          margin: EdgeInsets.zero, fontSize: 20, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), textColor: Colors.black)),
                  MyButton(
                      action: () => launchUrl(Uri.parse(profile.downloadCv)),
                      label: 'Download resume',
                      height: 45,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      shape: const StadiumBorder(),
                      background: Colors.yellow.shade700,
                      foreground: Colors.black87,
                      borderColor: Colors.black38),
                ],
              )),
        ),
        Card(
            margin: padding,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
            child: Column(children: [
              MyText(profile.fullName,
                  alignment: Alignment.centerLeft,
                  fontFamily: 'Rubik',
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  textColor: Colors.redAccent,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
              const Divider(
                color: Colors.redAccent,
                indent: 20,
                height: 10,
                endIndent: 40,
                thickness: 0.6,
              ),
              MyText(profile.introLine,
                  fontFamily: 'Courier',
                  padding: const EdgeInsets.fromLTRB(22, 0, 0, 10),
                  alignment: Alignment.centerLeft,
                  textColor: MyColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
              MyText(profile.bio,
                  fontFamily: 'SofiaSans',
                  padding: const EdgeInsets.fromLTRB(22, 0, 30, 20),
                  alignment: Alignment.centerLeft,
                  textColor: MyColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
              MyText('Language Speak: ${profile.languages}',
                  fontFamily: 'Rubik',
                  padding: const EdgeInsets.fromLTRB(22, 0, 0, 20),
                  alignment: Alignment.centerLeft,
                  textColor: MyColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              const SizedBox(height: 20),
            ]))
      ]);
}

educationTile(EducationModel item) => Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.school_rounded, color: Colors.black87, size: 18),
          Container(width: 2, height: 20, margin: const EdgeInsets.symmetric(horizontal: 16), color: Colors.black45),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(item.program,
                    fontFamily: 'Rubik',
                    padding: const EdgeInsets.only(bottom: 4),
                    alignment: Alignment.centerLeft,
                    textColor: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                MyText(item.year, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, textColor: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.w400),
                MyText(item.institution, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, textColor: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
                MyText(item.details, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, textColor: Colors.black54, fontSize: 18, fontWeight: FontWeight.w400),
                MyText(item.others, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, textColor: Colors.black54, fontSize: 18, fontWeight: FontWeight.w400),
              ],
            ),
          )
        ],
      ),
    );

experienceTile(EducationModel item) => Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.work_outline_rounded, color: Colors.black87, size: 18),
          Container(width: 2, height: 100, margin: const EdgeInsets.symmetric(horizontal: 16), color: Colors.black45),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(item.year, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, textColor: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.w400),
                MyText(item.institution, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, textColor: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
                MyText(item.details, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, textColor: Colors.black54, fontSize: 18, fontWeight: FontWeight.w400),
                MyText(item.others, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, textColor: Colors.black54, fontSize: 18, fontWeight: FontWeight.w400),
              ],
            ),
          )
        ],
      ),
    );

skillsTile(String label) => OnHover(
      builder: (isHovered) => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: isHovered ? Colors.black : Colors.transparent,
            border: Border.all(color: Colors.blueAccent, width: 1.8),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          margin: const EdgeInsets.only(left: 10),
          child: Text(label, style: TextStyle(color: isHovered ? Colors.white : Colors.black, fontFamily: 'RobotoSlab', fontWeight: FontWeight.bold))),
    );
