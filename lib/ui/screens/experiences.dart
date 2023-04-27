import 'package:flutter/material.dart';

import '../../constants/global_keys.dart';
import '../../utils/__colors.dart';
import '../../widgets/widget_default/__text.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  double radius = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
        key: MyGlobalKey.experienceKey,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: Row(
                children: [
                  Expanded(
                    flex: 20,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(radius), bottom: Radius.circular(radius))),
                      child: Container(
                          padding: const EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(radius), bottom: Radius.circular(radius))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.vertical(bottom: const Radius.circular(10), top: Radius.circular(radius)),
                                  child: Image.asset('asset/images/avatar.png', fit: BoxFit.contain)),
                              const SizedBox(height: 6),
                              myText('E-mail', padding: const EdgeInsets.only(bottom: 3, top: 10), fontFamily: 'SofiaSans', color: Colors.black),
                              FittedBox(
                                  child: myText('akaomarfahimofficial@gmail.com',
                                      fontsize: 30, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black)),
                              myText('Phone', padding: const EdgeInsets.only(bottom: 3, top: 14), fontFamily: 'SofiaSans', color: Colors.black),
                              myText('+8801839865200', fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black),
                              myText('Website', padding: const EdgeInsets.only(bottom: 3, top: 14), fontFamily: 'SofiaSans', color: Colors.black),
                              FittedBox(
                                  child:
                                      myText('akaomarfahim.com', maxLines: 2, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black)),
                              myText('Address', padding: const EdgeInsets.only(bottom: 3, top: 14), fontFamily: 'SofiaSans', color: Colors.black),
                              myText('Dhaka, Bangladesh', fontsize: 12, fontFamily: 'SofiaSans', padding: const EdgeInsets.symmetric(horizontal: 20), color: Colors.black),
                              const SizedBox(height: 40),
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 80,
                    child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
                        child: Column(children: [
                          myText('Fazle Elahi Fahim',
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
                          myText('Computer Engineer',
                              fontFamily: 'Rubik',
                              padding: const EdgeInsets.fromLTRB(22, 0, 0, 40),
                              alignment: Alignment.centerLeft,
                              color: MyColors.primary,
                              fontsize: 18,
                              fontWeight: FontWeight.w400),
                          myText(
                              'I’m a student currently studying at Notre Dame University Bangladesh, Department of Computer Science and Engineering. Besides, I’m an Application Developer, Graphics Designer, and also an expert in computer hardware. I’m very much fashionable about my work and like to move around to experience new things. ',
                              fontFamily: 'Rubik',
                              padding: const EdgeInsets.fromLTRB(22, 0, 30, 20),
                              alignment: Alignment.centerLeft,
                              color: MyColors.primary,
                              fontsize: 18,
                              fontWeight: FontWeight.w400),
                          myText('Language: Bangla, Hindi, English',
                              fontFamily: 'Rubik',
                              padding: const EdgeInsets.fromLTRB(22, 0, 0, 20),
                              alignment: Alignment.centerLeft,
                              color: MyColors.primary,
                              fontsize: 16,
                              fontWeight: FontWeight.w400),
                          myText('Skills and Experiences: Bangla, Hindi, English',
                              fontFamily: 'Rubik',
                              padding: const EdgeInsets.fromLTRB(22, 0, 0, 40),
                              alignment: Alignment.centerLeft,
                              color: MyColors.primary,
                              fontsize: 16,
                              fontWeight: FontWeight.w400),
                          const SizedBox(height: 40),
                        ])),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
