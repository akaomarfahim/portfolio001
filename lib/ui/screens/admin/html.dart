// import 'dart:developer';

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:html_editor_enhanced/html_editor.dart';
// import 'package:portfolio_final_omar/firebase_options.dart';
// import 'package:portfolio_final_omar/models/works_model.dart';
// import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     HtmlEditorController controller = HtmlEditorController(processInputHtml: true, processNewLineAsBr: true, processOutputHtml: true);
//     // controller.setHint

//     return Scaffold(
//         body: SafeArea(
//             child: Column(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         HtmlEditor(
//           controller: controller, //required
          
//           htmlEditorOptions: const HtmlEditorOptions(
//             spellCheck: true,
//             autoAdjustHeight: true,
//             initialText: '''
// <p>Hello people how are you</p><p><br></p><div style="color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; line-height: 18px; white-space: pre;"><span style="color: #4ec9b0;">WorksModel</span> <span style="color: #9cdcfe;">item</span> = <span style="color: #4ec9b0;">WorksModel</span>.<span style="color: #dcdcaa;">fromMap</span>(<span style="color: #4ec9b0;">Map</span>&lt;<span style="color: #4ec9b0;">String</span>, <span style="color: #4ec9b0;">dynamic</span>&gt;.<span style="color: #dcdcaa;">from</span>(<span style="color: #9cdcfe;">element</span>.<span style="color: #9cdcfe;">value</span> <span style="color: #569cd6;">as</span> <span style="color: #4ec9b0;">Map</span>));</div>''',
//             disabled: true,


//             customOptions: ''
//           ),
//           otherOptions: const OtherOptions(height: 400, decoration: BoxDecoration()),

//           htmlToolbarOptions: const HtmlToolbarOptions(
//               toolbarType: ToolbarType.nativeGrid,
              
//               // toolbarItemHeight: 500,

//               // onDropdownChanged: (p0, p1, p2) {
//               //       print("dropdown '${describeEnum(type)}' changed to $changed");
//               //       //run a callback and return false and update the changed value, otherwise
//               //       return true;
//               //     },

//               defaultToolbarButtons: [
//                 StyleButtons(),
//                 FontSettingButtons(),
//                 FontButtons(),
//                 ColorButtons(),
//                 ListButtons(),
//                 ParagraphButtons(),
//                 InsertButtons(),
//                 OtherButtons(),
//               ],
//               customToolbarButtons: [
//                 //your widgets here
//                 // Button1(),
//                 // Button2(),
//               ],
//               customToolbarInsertionIndices: [
//                 2,
//                 5
//               ]),
//         ),
//         myButton(
//             action: () async {
//               String data = await controller.getText();
//               log('TEXT: $data');

//               await WorksModel.getData();

//               int key = WorksModel.items.last.key;
//               key++;

//               DatabaseReference ref = FirebaseConnection.connect;
//               await ref.child('works/$key').update({"description": data});
//               // controller.insertNetworkImage(url)
//             },
//             label: const Text('go'))
//       ],
//     )));
//   }
// }
