import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:portfolio_final_omar/constants/root.dart';
import 'package:portfolio_final_omar/models/blog_model.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/def.dart';
import '../../providers/screen_provider.dart';
import '../../widgets/widget_default/__text.dart';

class BlogDetails extends StatelessWidget {
  final BlogModel item;
  const BlogDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.grey.shade300,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () => context.read<ScreenProvider>().reset(),
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.black)),
            if (item.imageUrl.isNotEmptyAndNotNull)
              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Def.cardBorderRadius)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(Def.cardBorderRadius),
                      child: Image.network(item.imageUrl ?? FirebaseDataRoot.imageErrorLink, height: 300, width: double.infinity, fit: BoxFit.cover))),
            MyText(item.title,
                fontFamily: 'Rubik',
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
                fontWeight: FontWeight.bold,
                fontSize: 24,
                alignment: Alignment.centerLeft,
                textColor: Colors.black),
            MyText('${item.publisedDate} | ${item.author}',
                fontWeight: FontWeight.bold,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                fontSize: 14,
                fontFamily: 'SofiaSans',
                alignment: Alignment.topLeft,
                textColor: Colors.black87),
            Card(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: HtmlWidget(
                    item.description ?? '',
                    isSelectable: true,
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
