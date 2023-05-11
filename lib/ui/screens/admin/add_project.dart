import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:portfolio_final_omar/firebase_options.dart';
import 'package:portfolio_final_omar/models/works_model.dart';
import 'package:portfolio_final_omar/utils/__screen.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__loadings.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__textfield.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__toast.dart';
import '../../../file/w_image_upload.dart';
import '../../../utils/__time.dart';

class AddProject extends StatefulWidget {
  final bool isEditMood;
  final WorksModel? item;
  const AddProject({Key? key, this.isEditMood = false, this.item}) : super(key: key);

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  bool isLoadingComplete = false;
  // Controller ::
  String imageUrl = '';
  final titleController = TextEditingController();
  final mottoController = TextEditingController();
  final categoryController = TextEditingController();
  final platformController = TextEditingController();
  final urlDirectDownloadController = TextEditingController();
  final urlLiveDemoController = TextEditingController();
  final urlPlayStoreController = TextEditingController();
  final urlAppleStoreController = TextEditingController();
  final durationController = TextEditingController();
  final descriptionController = TextEditingController();
  final featuresController = TextEditingController();
  final toolsController = TextEditingController();
  final controllerHtml = HtmlEditorController();
  List<String> customFontList = ['Courier', 'sans-serif', 'Times', 'RobotoSlab', 'Rubik', 'RubikMoonrocks', 'SofiaSans'];

  @override
  void initState() {
    super.initState();
    ROOTMyTextField.externalLabelPadding = const EdgeInsets.fromLTRB(2, 0, 0, 6);
    ROOTMyTextField.externalLabelTextStyle = const TextStyle(fontFamily: 'Rubik', color: Colors.black);
    ROOTMyTextField.margin = const EdgeInsets.fromLTRB(15, 0, 15, 15);
    ROOTMyText.alignment = Alignment.centerLeft;

    loadData();
  }

  loadData() async {
    setState(() => isLoadingComplete = false);

    if (widget.isEditMood) {
      WorksModel item = widget.item ?? WorksModel();
      imageUrl = item.imageUrl ?? '';
      titleController.text = item.title ?? '';
      mottoController.text = item.motto ?? '';
      categoryController.text = item.category ?? '';
      urlDirectDownloadController.text = item.urlDownload ?? '';
      urlLiveDemoController.text = item.urlLiveDemo ?? '';
      urlPlayStoreController.text = item.urlPlayStore ?? '';
      urlAppleStoreController.text = item.urlAppleStore ?? '';
      durationController.text = item.projectDuration ?? '';
      descriptionController.text = item.description ?? '';
      featuresController.text = item.features ?? '';
      toolsController.text = item.toolsUsed ?? '';
    }
    setState(() => isLoadingComplete = true);
  }

  postData({int? keytoUpDateData}) async {
    try {
      setState(() => isLoadingComplete = false);
      myLoadingDialog(context);
      await WorksModel.getData();

      log('log 0');
      int key = WorksModel.items.isNotEmpty ? WorksModel.items.last.key ?? -1 : 0;
      key++;
      log('log 1');
      if (keytoUpDateData != null) key = keytoUpDateData;
      log('log 2');

      String htmlCode = await controllerHtml.getText();
      log('log 3');
      WorksModel item = WorksModel(
          imageUrl: imageUrl,
          title: titleController.text,
          motto: mottoController.text,
          category: categoryController.text,
          projectDuration: durationController.text,
          projectPlatform: platformController.text,
          toolsUsed: '',
          description: descriptionController.text,
          publisedDate: MyTime.getDateTime(),
          urlDownload: urlDirectDownloadController.text,
          urlLiveDemo: urlLiveDemoController.text,
          urlPlayStore: urlPlayStoreController.text,
          urlAppleStore: urlAppleStoreController.text,
          features: featuresController.text,
          otherDetails: htmlCode);
      log('log 4');

      DatabaseReference ref = FirebaseConnection.connect;
      log('log 5');
      await ref.child('works').child(key.toString()).update(item.toMap());
      log('log 6');
      myToast(keytoUpDateData == null ? 'new project added...' : 'Data Updated');
      if (mounted) Navigator.pop(context);
      if (mounted) Navigator.pop(context);
    } catch (e) {
      log('ERROR ; $e');
    }
  }

  updatePost() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Container(
          padding: Screen.isDesktop(context) ? const EdgeInsets.symmetric(horizontal: 40, vertical: 10) : EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                MyText('Cover Image', fontFamily: 'Rubik', fontSize: 14, textColor: Colors.black, padding: const EdgeInsets.fromLTRB(17, 0, 0, 6)),
                FirebaseImageUpload(height: 200, margin: ROOTMyTextField.margin, imageUrl: imageUrl, callbackImageUlr: (url) => imageUrl = url),
                MyButton(
                    action: () async => widget.isEditMood ? await postData(keytoUpDateData: widget.item!.key) : await postData(),
                    icon: Icons.post_add,
                    isLoadingComplete: isLoadingComplete,
                    height: 40,
                    label: widget.isEditMood ? 'Update' : 'POST',
                    shape: const StadiumBorder()),
                MyTextField(controller: titleController, hint: 'Title of the project', margin: ROOTMyTextField.margin, externalLabel: 'Project Title', minlines: 2, maxlines: 4),
                MyTextField(controller: mottoController, hint: 'Motto . . .', externalLabel: 'Project Motto', minlines: 1, maxlines: 2),
                MyTextField(controller: categoryController, hint: 'Category . . .', externalLabel: 'Project Category', minlines: 1, maxlines: 2),
                MyTextField(controller: urlDirectDownloadController, hint: 'URL - Direct Download . . .', externalLabel: 'Direct Download url', minlines: 1, maxlines: 2),
                MyTextField(controller: urlLiveDemoController, hint: 'URL - Live Demo . . .', externalLabel: 'Live Demo url', minlines: 1, maxlines: 2),
                MyTextField(controller: urlPlayStoreController, hint: 'URL - Play Store . . .', externalLabel: 'Play Store url', minlines: 1, maxlines: 2),
                MyTextField(controller: urlAppleStoreController, hint: 'URL - Apple Store . . .', externalLabel: 'Apple Store url', minlines: 1, maxlines: 2),
                MyTextField(controller: durationController, hint: 'Duration of the Project . . .',  externalLabel: 'Project Duration', minlines: 1, maxlines: 2),
                MyTextField(controller: descriptionController, hint: 'Description . . .', externalLabel: 'Project Description', minlines: 4, maxlines: 10),
                MyTextField(controller: featuresController, hint: 'Project Features . . .', externalLabel: 'Project Features', minlines: 2, maxlines: 10),
                MyTextField(controller: platformController, hint: 'Platform Used . . .', externalLabel: 'Platform Used', minlines: 2, maxlines: 10),
                MyText('Project Presentation', fontFamily: 'Rubik', fontSize: 14, textColor: Colors.black, padding: const EdgeInsets.fromLTRB(17, 0, 0, 6)),
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                  margin: ROOTMyTextField.margin,
                  child: HtmlEditor(
                      controller: controllerHtml, //required
                      htmlToolbarOptions: HtmlToolbarOptions(
                          toolbarType: Screen.isDesktop(context) ? ToolbarType.nativeGrid : ToolbarType.nativeScrollable,
                          initiallyExpanded: true,
                          defaultToolbarButtons: [
                            const StyleButtons(),
                            const FontSettingButtons(),
                            const FontButtons(),
                            const ColorButtons(),
                            const ListButtons(),
                            const ParagraphButtons(),
                            const InsertButtons(),
                            const OtherButtons(),
                          ],
                          customToolbarButtons: [
                            Container(
                              padding: const EdgeInsets.only(left: 8.0),
                              height: kMinInteractiveDimension,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).scaffoldBackgroundColor, border: Border.all(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12))),
                              child: CustomDropdownButtonHideUnderline(
                                  child: CustomDropdownButton<String>(
                                      menuMaxHeight: MediaQuery.of(context).size.height / 3,
                                      menuDirection: DropdownMenuDirection.down,
                                      items: [
                                        for (int i = 0; i < customFontList.length; i++)
                                          CustomDropdownMenuItem(
                                              value: customFontList[i], child: PointerInterceptor(child: Text(customFontList[i], style: TextStyle(fontFamily: customFontList[i])))),
                                      ],
                                      value: customFontList[0],
                                      onChanged: (String? changed) async => (changed != null) ? controllerHtml.execCommand('fontName', argument: changed) : null)),
                            )
                          ],
                          renderBorder: true,
                          buttonBorderRadius: const BorderRadius.all(Radius.circular(4))),
                      htmlEditorOptions: HtmlEditorOptions(
                          hint: "Your text here...",
                          adjustHeightForKeyboard: true,
                          initialText: widget.isEditMood ? widget.item!.otherDetails ?? '' : null,
                          androidUseHybridComposition: true,
                          shouldEnsureVisible: true,
                          autoAdjustHeight: false,
                          spellCheck: true),
                      otherOptions: OtherOptions(height: MediaQuery.of(context).size.height * 0.80, decoration: const BoxDecoration(color: Colors.white)),
                      plugins: const []),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
