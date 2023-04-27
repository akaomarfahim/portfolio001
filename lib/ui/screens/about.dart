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
import '../../constants/global_keys.dart';
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
                key: MyGlobalKey.aboutKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    myText('About Me', alignment: Alignment.centerLeft, padding: padding, color: MyColors.primary, fontFamily: 'Rubik', fontsize: 24, fontWeight: FontWeight.w800),
                    const SizedBox(height: 20),
                    context.isMobile ? aboutHeaderMobile() : aboutHeaderDesktop(),
                    Card(
                      margin: padding,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myText('Programming Skills',
                              alignment: Alignment.centerLeft,
                              fontFamily: 'Rubik',
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              color: Colors.redAccent,
                              fontsize: 22,
                              fontWeight: FontWeight.bold),
                          const Divider(
                            color: Colors.redAccent,
                            indent: 20,
                            endIndent: 40,
                            height: 10,
                            thickness: 0.4,
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            runSpacing: 10,
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.start,
                            children: [
                              for (int i = 0; i < programmingSkills.length; i++) ...[
                                programmingSkillTile(programmingSkills[i]),
                              ]
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Card(
                      margin: padding,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myText('Other Skills',
                              alignment: Alignment.centerLeft,
                              fontFamily: 'Rubik',
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              color: Colors.redAccent,
                              fontsize: 22,
                              fontWeight: FontWeight.bold),
                          const Divider(
                            color: Colors.redAccent,
                            indent: 20,
                            endIndent: 40,
                            height: 10,
                            thickness: 0.4,
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            runSpacing: 10,
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.start,
                            children: [
                              for (int i = 0; i < otherSkills.length; i++) ...[
                                programmingSkillTile(otherSkills[i]),
                              ]
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    if (EducationModel.items.isNotEmpty)
                      Card(
                        margin: padding,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                        child: Column(
                          children: [
                            myText('Education',
                                alignment: Alignment.centerLeft,
                                fontFamily: 'Rubik',
                                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                color: Colors.redAccent,
                                fontsize: 22,
                                fontWeight: FontWeight.bold),
                            const Divider(
                              color: Colors.redAccent,
                              indent: 20,
                              endIndent: 40,
                              height: 10,
                              thickness: 0.4,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              reverse: true,
                              itemCount: EducationModel.items.length,
                              itemBuilder: (context, index) => educationTile(EducationModel.items[index]),
                            ),
                            const SizedBox(height: 10)
                          ],
                        ),
                      ),
                    if (EducationModel.experieces.isNotEmpty)
                      Card(
                        margin: padding,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                        child: Column(
                          children: [
                            myText('Experiences',
                                alignment: Alignment.centerLeft,
                                fontFamily: 'Rubik',
                                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                color: Colors.redAccent,
                                fontsize: 22,
                                fontWeight: FontWeight.bold),
                            const Divider(
                              color: Colors.redAccent,
                              indent: 20,
                              endIndent: 40,
                              height: 10,
                              thickness: 0.4,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: EducationModel.experieces.length,
                              reverse: true,
                              itemBuilder: (context, index) => experienceTile(EducationModel.experieces[index]),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    Card(
                      margin: padding,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                      child: Column(
                        children: [
                          myText('Self-Evaluation',
                              alignment: Alignment.centerLeft,
                              fontFamily: 'Rubik',
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                              color: Colors.redAccent,
                              fontsize: 22,
                              fontWeight: FontWeight.bold),
                          const Divider(
                            color: Colors.redAccent,
                            indent: 20,
                            endIndent: 40,
                            height: 10,
                            thickness: 0.4,
                          ),
                          myText(profile.selfEvaluation,
                              fontFamily: 'Rubik',
                              padding: const EdgeInsets.fromLTRB(22, 10, 0, 40),
                              alignment: Alignment.centerLeft,
                              color: MyColors.primary,
                              fontsize: 16,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                )));
  }

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
                    myText('E-mail', padding: const EdgeInsets.only(bottom: 3), fontFamily: 'SofiaSans', color: Colors.black),
                    FittedBox(child: myText(profile.email, fontsize: 30, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black)),
                    myText('Phone', padding: const EdgeInsets.only(bottom: 3, top: 14), fontFamily: 'SofiaSans', color: Colors.black),
                    myText(profile.phone, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black),
                    myText('Website', padding: const EdgeInsets.only(bottom: 3, top: 14), fontFamily: 'SofiaSans', color: Colors.black),
                    FittedBox(child: myText(profile.website, maxLines: 2, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black)),
                    myText('Address', padding: const EdgeInsets.only(bottom: 3, top: 14), fontFamily: 'SofiaSans', color: Colors.black),
                    myText(profile.address, fontsize: 12, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black),
                    myButton(
                        action: () => launchUrl(Uri.parse(profile.downloadCv)),
                        label: myText('Download CV', fontWeight: FontWeight.bold),
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
                child: Column(children: [
                  myText(profile.fullName,
                      alignment: Alignment.centerLeft,
                      fontFamily: 'Rubik',
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                      color: Colors.redAccent,
                      fontsize: 27,
                      fontWeight: FontWeight.bold),
                  const Divider(
                    color: Colors.redAccent,
                    indent: 20,
                    height: 10,
                    endIndent: 40,
                    thickness: 0.6,
                  ),
                  myText(profile.introLine,
                      fontFamily: 'Rubik',
                      padding: const EdgeInsets.fromLTRB(22, 0, 0, 40),
                      alignment: Alignment.centerLeft,
                      color: MyColors.primary,
                      fontsize: 18,
                      fontWeight: FontWeight.w400),
                  myText(profile.bio,
                      fontFamily: 'Rubik',
                      padding: const EdgeInsets.fromLTRB(22, 0, 30, 20),
                      alignment: Alignment.centerLeft,
                      color: MyColors.primary,
                      fontsize: 18,
                      fontWeight: FontWeight.w400),
                  myText('Language Speak: ${profile.languages}',
                      fontFamily: 'Rubik',
                      padding: const EdgeInsets.fromLTRB(22, 0, 0, 20),
                      alignment: Alignment.centerLeft,
                      color: MyColors.primary,
                      fontsize: 16,
                      fontWeight: FontWeight.w400),
                  // myText('Skills and Experiences: ${profile.otherSkills}',
                  //     fontFamily: 'Rubik',
                  //     padding: const EdgeInsets.fromLTRB(22, 0, 0, 40),
                  //     alignment: Alignment.centerLeft,
                  //     color: MyColors.primary,
                  //     fontsize: 16,
                  //     fontWeight: FontWeight.w400),
                  const SizedBox(height: 20),
                ])),
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
                  myText('E-mail', padding: const EdgeInsets.only(bottom: 3), fontFamily: 'SofiaSans', color: Colors.black),
                  FittedBox(child: myText(profile.email, fontsize: 30, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black)),
                  myText('Phone', padding: const EdgeInsets.only(bottom: 3, top: 14), fontFamily: 'SofiaSans', color: Colors.black),
                  myText(profile.phone, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black),
                  myText('Website', padding: const EdgeInsets.only(bottom: 3, top: 14), fontFamily: 'SofiaSans', color: Colors.black),
                  FittedBox(child: myText(profile.website, maxLines: 2, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black)),
                  myText('Address', padding: const EdgeInsets.only(bottom: 3, top: 14), fontFamily: 'SofiaSans', color: Colors.black),
                  myText(profile.address, fontsize: 12, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black),
                  myButton(
                      action: () => launchUrl(Uri.parse(profile.downloadCv)),
                      label: myText('Download CV', fontWeight: FontWeight.bold),
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              myText(profile.fullName,
                  alignment: Alignment.centerLeft,
                  fontFamily: 'Rubik',
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  color: Colors.redAccent,
                  fontsize: 27,
                  fontWeight: FontWeight.bold),
              const Divider(
                color: Colors.redAccent,
                indent: 20,
                height: 10,
                endIndent: 40,
                thickness: 0.6,
              ),
              myText(profile.introLine,
                  fontFamily: 'Rubik',
                  padding: const EdgeInsets.fromLTRB(22, 0, 0, 40),
                  alignment: Alignment.centerLeft,
                  color: MyColors.primary,
                  fontsize: 18,
                  fontWeight: FontWeight.w400),
              myText(profile.bio,
                  fontFamily: 'Rubik',
                  padding: const EdgeInsets.fromLTRB(22, 0, 30, 20),
                  alignment: Alignment.centerLeft,
                  color: MyColors.primary,
                  fontsize: 18,
                  fontWeight: FontWeight.w400),
              myText('Language Speak: ${profile.languages}',
                  fontFamily: 'Rubik',
                  padding: const EdgeInsets.fromLTRB(22, 0, 0, 20),
                  alignment: Alignment.centerLeft,
                  color: MyColors.primary,
                  fontsize: 16,
                  fontWeight: FontWeight.w400),
              // myText('Skills and Experiences: ${profile.otherSkills}',
              //     fontFamily: 'Rubik',
              //     padding: const EdgeInsets.fromLTRB(22, 0, 0, 40),
              //     alignment: Alignment.centerLeft,
              //     color: MyColors.primary,
              //     fontsize: 16,
              //     fontWeight: FontWeight.w400),
              // const SizedBox(height: 20),
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
                myText(item.program,
                    fontFamily: 'Rubik',
                    padding: const EdgeInsets.only(bottom: 4),
                    alignment: Alignment.centerLeft,
                    color: Colors.black87,
                    fontsize: 16,
                    fontWeight: FontWeight.bold),
                myText(item.year, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, color: Colors.grey.shade600, fontsize: 14, fontWeight: FontWeight.w400),
                myText(item.institution, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, color: Colors.black87, fontsize: 20, fontWeight: FontWeight.bold),
                myText(item.details, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, color: MyColors.primary, fontsize: 18, fontWeight: FontWeight.w400),
                myText(item.others, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, color: MyColors.primary, fontsize: 18, fontWeight: FontWeight.w400),
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
                myText(item.year, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, color: Colors.grey.shade600, fontsize: 14, fontWeight: FontWeight.w400),
                myText(item.institution, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, color: Colors.black87, fontsize: 20, fontWeight: FontWeight.bold),
                myText(item.details, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, color: MyColors.primary, fontsize: 18, fontWeight: FontWeight.w400),
                myText(item.others, fontFamily: 'SofiaSans', alignment: Alignment.centerLeft, color: MyColors.primary, fontsize: 18, fontWeight: FontWeight.w400),
              ],
            ),
          )
        ],
      ),
    );

programmingSkillTile(String label) => OnHover(
      builder: (isHovered) => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: isHovered ? Colors.black : Colors.transparent,
            border: Border.all(color: Colors.blueAccent, width: 1.8),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          margin: const EdgeInsets.only(left: 20),
          child: Text(label, style: TextStyle(color: isHovered ? Colors.white : Colors.blueAccent, fontFamily: 'RobotoSlab', fontWeight: FontWeight.w500))),
    );
