import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/utils/__screen.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__textfield.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__toast.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final nameController = TextEditingController();
  final phonecontroller = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = Screen.isDesktop(context) ? Screen.width(context) * 0.40 : Screen.width(context);
    return Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Image.asset('asset/images/map.png'),
            Opacity(opacity: 0.4, child: Image.asset('asset/images/Dotted-Line-PNG-Picture.png', width: Screen.width(context) * 0.60)),
            Positioned(
              bottom: Screen.isDesktop(context) ? 10 : null,
              right: Screen.isDesktop(context) ? 70 : null,
              child: Container(
                width: width,
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText('Get in Touch', alignment: Alignment.centerLeft, textColor: Colors.white, fontSize: 28),
                      RichText(
                          textAlign: TextAlign.left,
                          text: const TextSpan(
                              text: 'Let\'s Talk about ',
                              style: TextStyle(fontFamily: 'Rubik', fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),
                              children: [TextSpan(text: 'Everything!', style: TextStyle(color: Colors.amberAccent, fontSize: 34, fontFamily: 'Rubik'))])),
                      SelectionArea(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          alignment: Alignment.centerRight,
                          child: RichText(
                              textAlign: TextAlign.right,
                              text: const TextSpan(
                                  text: 'Rmail me at - ',
                                  style: TextStyle(fontFamily: 'Robotoslab', fontWeight: FontWeight.normal, color: Colors.white),
                                  children: [TextSpan(text: 'akaomarfahim@gmail.com', style: TextStyle(color: Colors.redAccent, fontSize: 18, fontFamily: 'SofiaSans'))])),
                        ),
                      ),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Expanded(
                            child: MyTextField(
                                controller: nameController,
                                textStyle: const TextStyle(color: Colors.white),
                                focusColor: Colors.white,
                                cursorColor: Colors.white,
                                margin: const EdgeInsets.fromLTRB(10, 10, 6, 6),
                                hintStyle: const TextStyle(color: Colors.white),
                                backgroundColor: Colors.white30,
                                hint: 'Your name')),
                        Expanded(
                            child: MyTextField(
                                controller: phonecontroller,
                                textStyle: const TextStyle(color: Colors.white),
                                focusColor: Colors.white,
                                cursorColor: Colors.white,
                                margin: const EdgeInsets.fromLTRB(0, 10, 10, 6),
                                hintStyle: const TextStyle(color: Colors.white),
                                backgroundColor: Colors.white30,
                                hint: 'Phone')),
                      ]),
                      textInput(subjectController, 'Subject'),
                      MyTextField(
                          controller: messageController,
                          textStyle: const TextStyle(color: Colors.white),
                          focusColor: Colors.white,
                          cursorColor: Colors.white,
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 6),
                          minlines: 5,
                          maxlines: 10,
                          hintStyle: const TextStyle(color: Colors.white),
                          backgroundColor: Colors.white30,
                          hint: 'Message'),
                      MyButton(
                          action: () async {
                            if (nameController.text.isEmpty) {
                              myToast('Please enter your name', webBgColor: '#5946b2', webPosition: 'center');
                              return;
                            }
                            if (messageController.text.isEmpty) {
                              myToast('Please enter your message', webBgColor: '#5946b2', webPosition: 'center');
                              return;
                            }
                            String query =
                                'mailto:akaomarfahimofficial@gmail.com?subject=${subjectController.text}&body=${messageController.text} \nNAME: ${nameController.text} \nPHONE: ${phonecontroller.text}';
                            if (await canLaunchUrl(Uri.parse(query))) {
                              launchUrl(Uri.parse(query));
                            } else {
                              myToast('Error! Sending Email', webBgColor: '#5946b2', webPosition: 'center');
                            }
                          },
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 6),
                          background: Colors.white54,
                          height: 40,
                          label: 'SEND'),
                      const SizedBox(height: 5)

                      // const MyText('E-mail : akaomarfahim@gmail.com', textColor: Colors.white),
                      // const MyText('phone : +880 18398 65200', textColor: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

textInput(TextEditingController controller, String hint) => MyTextField(
    controller: controller,
    textStyle: const TextStyle(color: Colors.white),
    focusColor: Colors.white,
    cursorColor: Colors.white,
    hintStyle: const TextStyle(color: Colors.white),
    backgroundColor: Colors.white30,
    hint: hint);
