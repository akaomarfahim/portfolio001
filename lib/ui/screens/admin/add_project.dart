import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:portfolio_final_omar/backend/Firebase/firebase_backend.dart';
import 'package:portfolio_final_omar/models/works_model.dart';
import 'package:portfolio_final_omar/ui/screens/works.dart';
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
    if (imageUrl.isEmpty || titleController.text.isEmpty) {
      myToast('Image and title is required...');
      return;
    }

    try {
      setState(() => isLoadingComplete = false);
      myLoadingDialog(context);
      String htmlCode = await controllerHtml.getText();

      WorksModel item = WorksModel(
          imageUrl: imageUrl,
          publisedDate: MyTime.getDateTime(),
          title: titleController.text,
          motto: mottoController.text,
          category: categoryController.text,
          projectDuration: durationController.text,
          projectPlatform: platformController.text,
          toolsUsed: toolsController.text,
          description: descriptionController.text,
          urlDownload: urlDirectDownloadController.text,
          urlLiveDemo: urlLiveDemoController.text,
          urlPlayStore: urlPlayStoreController.text,
          urlAppleStore: urlAppleStoreController.text,
          features: featuresController.text,
          presentation: htmlCode);

      (keytoUpDateData == null)
          ? await FirebaseAPI.addItem(address: 'works', data: item.toMap())
          : await FirebaseAPI.updateItem(address: 'works', key: keytoUpDateData, data: item.toMap());
      myToast(keytoUpDateData == null ? 'Project Added' : 'Data Updated');
      clear();
      setState(() => isLoadingComplete = true);
      if (mounted) Navigator.pop(context);
    } catch (e) {
      myToast('Error! something went wrong.');
      log('ERROR ; $e');
    }
  }

  clear() {
    imageUrl = '';
    titleController.clear();
    mottoController.clear();
    categoryController.clear();
    platformController.clear();
    urlDirectDownloadController.clear();
    urlLiveDemoController.clear();
    urlPlayStoreController.clear();
    urlAppleStoreController.clear();
    durationController.clear();
    descriptionController.clear();
    featuresController.clear();
    toolsController.clear();
    controllerHtml.clear();
  }

  @override
  Widget build(BuildContext context) {
    final margin = Screen.isDesktop(context) ? const EdgeInsets.fromLTRB(40, 0, 40, 6) : const EdgeInsets.fromLTRB(5, 0, 5, 6);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 75,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    MyText('Cover Image', textAlign: TextAlign.start, alignment: Alignment.centerLeft, fontFamily: 'Rubik', fontSize: 14, margin: margin, textColor: Colors.black),
                    FirebaseImageUpload(height: 200, margin: margin, imageUrl: imageUrl, callbackImageUlr: (url) => imageUrl = url),
                    MyButton(
                        action: () async => widget.isEditMood ? await postData(keytoUpDateData: widget.item!.key) : await postData(),
                        icon: Icons.post_add,
                        isLoadingComplete: isLoadingComplete,
                        height: 40,
                        margin: margin,
                        label: widget.isEditMood ? 'Update' : 'POST',
                        shape: const StadiumBorder()),
                    MyTextField(controller: titleController, margin: margin, hint: 'Title of the project', externalLabel: 'Project Title', minlines: 2, maxlines: 4),
                    MyTextField(controller: mottoController, margin: margin, hint: 'Motto . . .', externalLabel: 'Project Motto', minlines: 1, maxlines: 2),
                    MyTextField(controller: categoryController, margin: margin, hint: 'Category . . .', externalLabel: 'Project Category', minlines: 1, maxlines: 2),
                    MyTextField(controller: durationController, margin: margin, hint: 'Duration of the Project . . .', externalLabel: 'Project Duration', minlines: 1, maxlines: 2),
                    MyTextField(controller: descriptionController, margin: margin, hint: 'Description . . .', externalLabel: 'Project Description', minlines: 4, maxlines: 10),
                    MyTextField(controller: featuresController, margin: margin, hint: 'Project Features . . .', externalLabel: 'Project Features', minlines: 2, maxlines: 10),
                    MyTextField(controller: platformController, margin: margin, hint: 'Platform Used . . .', externalLabel: 'Platform Used', minlines: 2, maxlines: 10),
                    MyTextField(controller: toolsController, margin: margin, hint: 'Tools Used . . .', externalLabel: 'Tools Used', minlines: 2, maxlines: 10),
                    MyTextField(
                        controller: urlDirectDownloadController,
                        margin: margin,
                        hint: 'URL - Direct Download . . .',
                        externalLabel: 'Direct Download url',
                        minlines: 1,
                        maxlines: 2),
                    MyTextField(controller: urlLiveDemoController, margin: margin, hint: 'URL - Live Demo . . .', externalLabel: 'Live Demo url', minlines: 1, maxlines: 2),
                    MyTextField(controller: urlPlayStoreController, margin: margin, hint: 'URL - Play Store . . .', externalLabel: 'Play Store url', minlines: 1, maxlines: 2),
                    MyTextField(controller: urlAppleStoreController, margin: margin, hint: 'URL - Apple Store . . .', externalLabel: 'Apple Store url', minlines: 1, maxlines: 2),
                    MyText('Project Presentation',
                        alignment: Alignment.centerLeft,
                        margin: margin,
                        fontFamily: 'Rubik',
                        fontSize: 14,
                        textColor: Colors.black,
                        padding: const EdgeInsets.fromLTRB(2, 0, 0, 0)),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                      margin: margin,
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
                                                  value: customFontList[i],
                                                  child: PointerInterceptor(child: Text(customFontList[i], style: TextStyle(fontFamily: customFontList[i])))),
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
                              initialText: widget.isEditMood ? widget.item!.presentation ?? '' : null,
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
            if (Screen.isDesktop(context)) const Expanded(flex: 25, child: Works())
          ],
        ),
      ),
    );
  }
}
