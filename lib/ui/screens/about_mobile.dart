// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:portfolio_final_omar/models/education_model.dart';
// import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
// import '../../constants/global_keys.dart';
// import '../../utils/__colors.dart';
// import '../../widgets/widget_default/__button.dart';
// import 'about.dart';

// class AboutMobile extends StatefulWidget {
//   const AboutMobile({super.key});

//   @override
//   State<AboutMobile> createState() => _AboutMobileState();
// }

// class _AboutMobileState extends State<AboutMobile> {
//   double radius = 10;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.grey.shade300,
//         height: double.infinity,
//         width: double.infinity,
//         padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
//         child: SingleChildScrollView(
//             key: MyGlobalKey.aboutKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 40),
//                 myText('About Me', alignment: Alignment.centerLeft, color: MyColors.primary, fontFamily: 'Rubik', fontsize: 24, fontWeight: FontWeight.w800),
//                 const SizedBox(height: 20),
//                 Card(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(radius), bottom: Radius.circular(radius))),
//                   child: Container(
//                       // width: 220,
//                       padding: const EdgeInsets.all(4),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(radius), bottom: Radius.circular(radius))),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           ClipRRect(
//                               borderRadius: BorderRadius.vertical(bottom: const Radius.circular(10), top: Radius.circular(radius)),
//                               child: Image.asset('asset/images/avatar.png', fit: BoxFit.contain)),
//                           const SizedBox(height: 6),
//                           FittedBox(child: myText('E-mail', fontsize: 22, padding: const EdgeInsets.only(bottom: 3, top: 10), fontFamily: 'SofiaSans', color: Colors.black)),
//                           FittedBox(
//                               child: myText('akaomarfahimofficial@gmail.com',
//                                   fontsize: 30, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black)),
//                           FittedBox(child: myText('Phone', fontsize: 20, padding: const EdgeInsets.only(bottom: 3, top: 20), fontFamily: 'SofiaSans', color: Colors.black)),
//                           FittedBox(
//                               child: myText('+8801839865200', fontsize: 24, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black)),
//                           FittedBox(child: myText('Website', fontsize: 20, padding: const EdgeInsets.only(bottom: 3, top: 20), fontFamily: 'SofiaSans', color: Colors.black)),
//                           FittedBox(
//                               child: myText('akaomarfahim.com', fontsize: 20, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black)),
//                           FittedBox(child: myText('Address', fontsize: 20, padding: const EdgeInsets.only(bottom: 3, top: 20), fontFamily: 'SofiaSans', color: Colors.black)),
//                           FittedBox(
//                               child: myText('akaomarfahim.com', fontsize: 20, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black)),
//                           myButton(
//                               action: () {
//                                 log('message');
//                               },
//                               label: myText('Download CV', fontWeight: FontWeight.bold),
//                               margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                               shape: const StadiumBorder(),
//                               background: Colors.yellow.shade700,
//                               foreground: Colors.black87,
//                               borderColor: Colors.black38),
//                         ],
//                       )),
//                 ),
//                 Card(
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
//                     child: Column(children: [
//                       myText('Fazle Elahi Fahim',
//                           alignment: Alignment.centerLeft,
//                           fontFamily: 'Rubik',
//                           padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
//                           color: Colors.redAccent,
//                           fontsize: 20,
//                           fontWeight: FontWeight.bold),
//                       const Divider(
//                         color: Colors.redAccent,
//                         indent: 20,
//                         height: 10,
//                         endIndent: 40,
//                         thickness: 0.6,
//                       ),
//                       myText('Computer Engineer',
//                           fontFamily: 'Rubik',
//                           padding: const EdgeInsets.fromLTRB(22, 0, 0, 40),
//                           alignment: Alignment.centerLeft,
//                           color: MyColors.primary,
//                           fontsize: 14,
//                           fontWeight: FontWeight.w400),
//                       myText(
//                           'I’m a student currently studying at Notre Dame University Bangladesh, Department of Computer Science and Engineering. Besides, I’m an Application Developer, Graphics Designer, and also an expert in computer hardware. I’m very much fashionable about my work and like to move around to experience new things. ',
//                           fontFamily: 'Rubik',
//                           padding: const EdgeInsets.fromLTRB(22, 0, 30, 20),
//                           alignment: Alignment.centerLeft,
//                           color: MyColors.primary,
//                           fontsize: 14,
//                           fontWeight: FontWeight.w400),
//                       myText('Language: Bangla, Hindi, English',
//                           fontFamily: 'Rubik',
//                           padding: const EdgeInsets.fromLTRB(22, 0, 0, 20),
//                           alignment: Alignment.centerLeft,
//                           color: MyColors.primary,
//                           fontsize: 14,
//                           fontWeight: FontWeight.w400),
//                       myText('Skills and Experiences: Bangla, Hindi, English',
//                           fontFamily: 'Rubik',
//                           padding: const EdgeInsets.fromLTRB(22, 0, 0, 40),
//                           alignment: Alignment.centerLeft,
//                           color: MyColors.primary,
//                           fontsize: 14,
//                           fontWeight: FontWeight.w400),
//                       const SizedBox(height: 40),
//                     ])),
//                 Card(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       myText('Programming Skills',
//                           alignment: Alignment.centerLeft,
//                           fontFamily: 'Rubik',
//                           padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                           color: Colors.redAccent,
//                           fontsize: 18,
//                           fontWeight: FontWeight.bold),
//                       const Divider(
//                         color: Colors.redAccent,
//                         indent: 20,
//                         endIndent: 40,
//                         height: 10,
//                         thickness: 0.4,
//                       ),
//                       const SizedBox(height: 10),
//                       Wrap(
//                         runSpacing: 10,
//                         direction: Axis.horizontal,
//                         alignment: WrapAlignment.start,
//                         children: [
//                           programmingSkillTile('C Programming'),
//                           programmingSkillTile('C ++'),
//                           programmingSkillTile('Flutter'),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//                 Card(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       myText('Other Skills',
//                           alignment: Alignment.centerLeft,
//                           fontFamily: 'Rubik',
//                           padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                           color: Colors.redAccent,
//                           fontsize: 22,
//                           fontWeight: FontWeight.bold),
//                       const Divider(
//                         color: Colors.redAccent,
//                         indent: 20,
//                         endIndent: 40,
//                         height: 10,
//                         thickness: 0.4,
//                       ),
//                       const SizedBox(height: 10),
//                       Wrap(
//                         runSpacing: 10,
//                         direction: Axis.horizontal,
//                         alignment: WrapAlignment.start,
//                         children: [
//                           programmingSkillTile('C Programming'),
//                           programmingSkillTile('C ++'),
//                           programmingSkillTile('Flutter'),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//                 Card(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
//                   child: Column(
//                     children: [
//                       myText('Education',
//                           alignment: Alignment.centerLeft,
//                           fontFamily: 'Rubik',
//                           padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                           color: Colors.redAccent,
//                           fontsize: 18,
//                           fontWeight: FontWeight.bold),
//                       const Divider(
//                         color: Colors.redAccent,
//                         indent: 20,
//                         endIndent: 40,
//                         height: 10,
//                         thickness: 0.4,
//                       ),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: EducationModel.items.length,
//                         itemBuilder: (context, index) => educationTile(EducationModel.items[index]),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Card(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
//                   child: Column(
//                     children: [
//                       myText('Experiences',
//                           alignment: Alignment.centerLeft,
//                           fontFamily: 'Rubik',
//                           padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                           color: Colors.redAccent,
//                           fontsize: 18,
//                           fontWeight: FontWeight.bold),
//                       const Divider(
//                         color: Colors.redAccent,
//                         indent: 20,
//                         endIndent: 40,
//                         height: 10,
//                         thickness: 0.4,
//                       ),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: EducationModel.items.length,
//                         itemBuilder: (context, index) => experienceTile(EducationModel.items[index]),
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//                 Card(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
//                   child: Column(
//                     children: [
//                       myText('Self-Evaluation',
//                           alignment: Alignment.centerLeft,
//                           fontFamily: 'Rubik',
//                           padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                           color: Colors.redAccent,
//                           fontsize: 18,
//                           fontWeight: FontWeight.bold),
//                       const Divider(
//                         color: Colors.redAccent,
//                         indent: 20,
//                         endIndent: 40,
//                         height: 10,
//                         thickness: 0.4,
//                       ),
//                       myText('Skills and Experiences: Bangla, Hindi, English',
//                           fontFamily: 'Rubik',
//                           padding: const EdgeInsets.fromLTRB(22, 10, 0, 40),
//                           alignment: Alignment.centerLeft,
//                           color: MyColors.primary,
//                           fontsize: 16,
//                           fontWeight: FontWeight.w400),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 60),
//               ],
//             )));
//   }
// }
