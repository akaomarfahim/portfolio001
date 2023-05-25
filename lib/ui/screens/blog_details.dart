import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:portfolio_final_omar/constants/root.dart';
import 'package:portfolio_final_omar/models/blog_model.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:portfolio_final_omar/utils/__screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/def.dart';
import '../../widgets/widget_default/__text.dart';

class BlogDetails extends StatefulWidget {
  const BlogDetails({Key? key}) : super(key: key);

  @override
  State<BlogDetails> createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  bool isLoadingComplete = false;
  String? pageData = Get.parameters['pageData'];
  late int id;
  BlogModel item = BlogModel();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    setState(() => isLoadingComplete = false);
    await BlogModel.getData();
    id = int.tryParse(pageData ?? '-1') ?? -1;
    for (var element in BlogModel.items) {
      if (element.key == id) item = element;
    }
    setState(() => isLoadingComplete = true);
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = Screen.isDesktop(context) ? const EdgeInsets.fromLTRB(40, 2, 40, 2) : const EdgeInsets.symmetric(horizontal: 10, vertical: 6);

    return !isLoadingComplete
        ? const SplashScreen()
        : (BlogModel.items.isEmpty)
            ? const Center(child: Text('404! error\n Didn\'t find any item with this Id'))
            : Container(
                color: Colors.grey.shade300,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () => Get.back(),
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.black)),
                      if (item.imageUrl.isNotEmptyAndNotNull)
                        Card(
                            margin: margin,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Def.cardBorderRadius)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(Def.cardBorderRadius),
                                child: Image.network(item.imageUrl ?? FirebaseDataRoot.imageErrorLink, height: 300, width: double.infinity, fit: BoxFit.cover))),
                      MyText(item.title,
                          margin: margin,
                          fontFamily: 'Rubik',
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          alignment: Alignment.centerLeft,
                          textColor: Colors.black),
                      MyText('${item.publisedDate} | ${item.author}',
                          margin: margin,
                          fontWeight: FontWeight.bold,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          fontSize: 14,
                          fontFamily: 'SofiaSans',
                          alignment: Alignment.topLeft,
                          textColor: Colors.black87),
                      Card(
                          margin: margin,
                          color: Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.all(20), child: HtmlWidget(item.description ?? '', isSelectable: true, textStyle: const TextStyle(color: Colors.black)))),
                      const SizedBox(height: 30)
                    ],
                  ),
                ),
              );
  }
}
