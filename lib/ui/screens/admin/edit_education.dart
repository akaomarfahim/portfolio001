import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/backend/Firebase/firebase_backend.dart';
import 'package:portfolio_final_omar/models/education_model.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__loadings.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__textfield.dart';

class EditEducation extends StatefulWidget {
  const EditEducation({super.key});

  @override
  State<EditEducation> createState() => _EditEducationState();
}

class _EditEducationState extends State<EditEducation> {
  final insitutionControlller = TextEditingController();
  final yearControlller = TextEditingController();
  final programControlller = TextEditingController();
  final detailsControlller = TextEditingController();
  final othersControlller = TextEditingController();
  int key = -1;

  bool isLoadingComplete = false;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    setState(() => isLoadingComplete = false);
    DatabaseReference ref = FirebaseAPI.connect.child('education');
    ref.onValue.listen((event) async {
      await EducationModel.getData();
      setState(() {});
    });
    setState(() => isLoadingComplete = true);
  }

  updateEducation({int? updateKey}) async {
    myLoadingDialog(context);

    final educationData = EducationModel(
        key: (updateKey != -1) ? updateKey : null,
        institution: insitutionControlller.text,
        year: yearControlller.text,
        program: programControlller.text,
        details: detailsControlller.text,
        others: othersControlller.text);

    if (updateKey != -1) FirebaseAPI.updateItem(address: 'education', key: key, data: educationData.toMap());
    if (updateKey == -1) FirebaseAPI.addItem(address: 'education', data: educationData.toMap());
    Navigator.pop(context);
    clearData();
    setState(() {});
  }

  clearData() {
    key = -1;
    insitutionControlller.clear();
    yearControlller.clear();
    programControlller.clear();
    detailsControlller.clear();
    othersControlller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoadingComplete
        ? const SplashScreen()
        : Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: Row(
              children: [
                Expanded(
                    flex: 70,
                    child: Column(
                      children: [
                        MyTextField(controller: insitutionControlller, externalLabel: 'Institution Name'),
                        MyTextField(controller: yearControlller, externalLabel: 'year [2000 - 2004]'),
                        MyTextField(controller: programControlller, externalLabel: 'program'),
                        MyTextField(controller: detailsControlller, externalLabel: 'details'),
                        MyTextField(controller: othersControlller, maxlines: 4, minlines: 2, externalLabel: 'others'),
                        MyButton(action: () => updateEducation(updateKey: key), label: 'Update')
                      ],
                    )),
                Expanded(
                    flex: 30,
                    child: ReorderableListView.builder(
                        onReorder: (oldIndex, newIndex) async {
                          myLoadingDialog(context);
                          final oldItem = EducationModel.items[oldIndex];
                          final newItem = EducationModel.items[newIndex];

                          await FirebaseAPI.updateItem(address: 'education', key: newItem.key, data: oldItem.toMap());
                          await FirebaseAPI.updateItem(address: 'education', key: oldItem.key, data: newItem.toMap());
                          loadData();
                          if (mounted) Navigator.pop(context);
                        },
                        itemCount: EducationModel.items.length,
                        itemBuilder: (context, index) {
                          final e = EducationModel.items[index];
                          return InkWell(
                            key: ValueKey(index),
                            onTap: () {
                              key = e.key ?? -1;
                              insitutionControlller.text = e.institution ?? '';
                              yearControlller.text = e.year ?? '';
                              programControlller.text = e.program ?? '';
                              detailsControlller.text = e.details ?? '';
                              othersControlller.text = e.others ?? '';
                            },
                            child: Card(
                                child: ListTile(
                              title: Text(e.institution ?? ''),
                              subtitle: Text("${e.year}\n${e.program}\n${e.details}\n${e.others}"),
                              trailing: IconButton(
                                  onPressed: () async {
                                    myLoadingDialog(context);
                                    await FirebaseAPI.removeItem(address: 'education', key: e.key);
                                    if (mounted) Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.remove_circle_outline, color: Colors.red.shade600)),
                            )),
                          );
                        })

                    // Column(
                    //   children: EducationModel.items
                    //       .map((e) => InkWell(
                    //             onTap: () {
                    //               key = e.key ?? -1;
                    //               insitutionControlller.text = e.institution ?? '';
                    //               yearControlller.text = e.year ?? '';
                    //               programControlller.text = e.program ?? '';
                    //               detailsControlller.text = e.details ?? '';
                    //               othersControlller.text = e.others ?? '';
                    //             },
                    //             child: Card(
                    //                 child: ListTile(
                    //               title: Text(e.institution ?? ''),
                    //               subtitle: Text("${e.year}\n${e.program}\n${e.details}\n${e.others}"),
                    //               trailing: IconButton(
                    //                   onPressed: () => FirebaseAPI.removeItem(address: 'education', key: e.key), icon: Icon(Icons.remove_circle_outline, color: Colors.red.shade600)),
                    //             )),
                    //           ))
                    //       .toList(),
                    // ),
                    )
              ],
            ),
          );
  }
}
