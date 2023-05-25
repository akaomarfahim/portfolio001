import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/backend/Firebase/firebase_backend.dart';
import 'package:portfolio_final_omar/models/profile_model.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__loadings.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__textfield.dart';

class EditAbout extends StatefulWidget {
  const EditAbout({super.key});

  @override
  State<EditAbout> createState() => _EditAboutState();
}

class _EditAboutState extends State<EditAbout> {
  final controller = TextEditingController();
  bool isLoadingComplete = false;
  String key = '';
  String data = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    setState(() => isLoadingComplete = false);
    DatabaseReference ref = FirebaseAPI.connect.child('profile');
    ref.onValue.listen((event) async {
      await ProfileModel.getData();
      setState(() {});
    });
    setState(() => isLoadingComplete = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: !isLoadingComplete
          ? Center(child: myCircularLoader())
          : Row(
              children: [
                Expanded(
                    flex: 60,
                    child: Column(
                      children: [
                        MyTextField(controller: controller, maxlines: 16, minlines: 1, externalLabel: 'Item [$key - $data]'),
                        myButton(
                            isLoadingComplete: isLoadingComplete,
                            action: () async {
                              setState(() => isLoadingComplete = false);
                              await FirebaseAPI.updateData(address: 'profile', data: {key: controller.text.trim()});
                              setState(() => isLoadingComplete = true);
                            },
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 6),
                            label: const MyText('Update'))
                      ],
                    )),
                Expanded(
                    flex: 40,
                    child: ListView.builder(
                        itemCount: ProfileModel.profile!.toMap().entries.length,
                        itemBuilder: (context, index) {
                          final profileMap = ProfileModel.profile!.toMap().entries;
                          return InkWell(
                              onTap: () {
                                key = profileMap.elementAt(index).key;
                                data = profileMap.elementAt(index).value;
                                controller.text = profileMap.elementAt(index).value;
                                setState(() {});
                              },
                              child: Card(child: ListTile(title: Text(profileMap.elementAt(index).key), subtitle: Text(profileMap.elementAt(index).value))));
                        }))
              ],
            ),
    );
  }
}
