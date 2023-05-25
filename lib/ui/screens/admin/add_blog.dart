import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:portfolio_final_omar/models/blog_model.dart';
import 'package:portfolio_final_omar/models/user_model.dart';
import 'package:portfolio_final_omar/ui/screens/blogs.dart';
import 'package:portfolio_final_omar/utils/__screen.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__textfield.dart';
import '../../../backend/Firebase/firebase_backend.dart';
import '../../../file/w_image_upload.dart';
import '../../../utils/__time.dart';
import '../../../widgets/widget_default/__loadings.dart';
import '../../../widgets/widget_default/__toast.dart';

class AddBlog extends StatefulWidget {
  final bool isEditMood;
  final BlogModel? item;
  const AddBlog({Key? key, this.isEditMood = false, this.item}) : super(key: key);

  @override
  State<AddBlog> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddBlog> {
  bool isLoadingComplete = false;
  // Controller ::
  String imageUrl = '';
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
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
      BlogModel item = widget.item ?? BlogModel();
      imageUrl = item.imageUrl ?? '';
      titleController.text = item.title ?? '';
      categoryController.text = item.category ?? '';
    }
    setState(() => isLoadingComplete = true);
  }

  postData({int? keytoUpDateData}) async {
    if (imageUrl.isEmpty || titleController.text.isEmpty) {
      myToast('Image and Title is required.');
      return;
    }

    try {
      setState(() => isLoadingComplete = false);
      myLoadingDialog(context);
      String htmlCode = await controllerHtml.getText();
      BlogModel item = BlogModel(
          imageUrl: imageUrl,
          author: UserModel.user.username,
          title: titleController.text,
          category: categoryController.text,
          description: htmlCode,
          publisedDate: MyTime.getDateTime());

      (keytoUpDateData == null) ? FirebaseAPI.addItem(address: 'blogs', data: item.toMap()) : FirebaseAPI.updateItem(address: 'blogs', key: keytoUpDateData, data: item.toMap());
      myToast(keytoUpDateData == null ? 'Blog Posted...' : 'Data Updated', textColor: Colors.white, webBgColor: 'linear-gradient(to right, #000000, #000000)');
      if (mounted) Navigator.pop(context);
      if (widget.isEditMood) Get.back();
      clear();
      setState(() => isLoadingComplete = true);
    } catch (e) {
      myToast('Error! something went wrong');
      log('ERROR ; $e');
    }
  }

  clear() {
    imageUrl = '';
    titleController.clear();
    categoryController.clear();
    controllerHtml.clear();
  }

  @override
  Widget build(BuildContext context) {
    final margin = Screen.isDesktop(context) ? const EdgeInsets.fromLTRB(40, 0, 40, 6) : const EdgeInsets.fromLTRB(5, 0, 5, 6);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
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
                      MyText('Cover Image',
                          textAlign: TextAlign.start, alignment: Alignment.centerLeft, fontFamily: 'Rubik', fontSize: 14, margin: margin, textColor: Colors.black),
                      FirebaseImageUpload(height: 200, margin: margin, imageUrl: imageUrl, callbackImageUlr: (url) => imageUrl = url),
                      MyButton(
                          action: () async => widget.isEditMood ? await postData(keytoUpDateData: widget.item!.key) : await postData(),
                          icon: Icons.post_add,
                          isLoadingComplete: isLoadingComplete,
                          height: 40,
                          margin: margin,
                          label: widget.isEditMood ? 'Update' : 'POST',
                          shape: const StadiumBorder()),
                      MyTextField(controller: titleController, margin: margin, hint: 'Title of the project', externalLabel: 'Title', minlines: 2, maxlines: 4),
                      MyTextField(controller: categoryController, margin: margin, hint: 'Category . . .', externalLabel: 'Category', minlines: 1, maxlines: 2),
                      MyText('Blog',
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
                                initialText: widget.isEditMood ? widget.item!.description ?? '' : null,
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
              if (Screen.isDesktop(context))
                const Expanded(
                  flex: 25,
                  child: Blogs(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
