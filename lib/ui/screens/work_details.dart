import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_final_omar/constants/def.dart';
import 'package:portfolio_final_omar/models/works_model.dart';
import 'package:portfolio_final_omar/providers/screen_provider.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__hover.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class WorkDetails extends StatefulWidget {
  final WorksModel item;
  const WorkDetails({super.key, required this.item});

  @override
  State<WorkDetails> createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  late WorksModel item;

  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

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
            IconButton(onPressed: () => context.read<ScreenProvider>().reset(), icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.black)),
            if (item.imageUrl.isNotEmpty)
              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Def.cardBorderRadius)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(Def.cardBorderRadius), child: Image.network(item.imageUrl, height: 300, width: double.infinity, fit: BoxFit.cover))),
            downloadButtons(context, item),
            myText(item.title,
                fontFamily: 'Rubik',
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                fontWeight: FontWeight.bold,
                fontsize: 24,
                alignment: Alignment.centerLeft,
                color: Colors.black),
            myText(item.publisedDate,
                fontWeight: FontWeight.bold,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                fontsize: 12,
                fontFamily: 'SofiaSans',
                alignment: Alignment.topLeft,
                color: Colors.black45),
            myText(item.description,
                fontWeight: FontWeight.bold,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                fontsize: 14,
                fontFamily: 'SofiaSans',
                alignment: Alignment.topLeft,
                color: Colors.black87),
            boxDetails('Features', item.features),
            boxDetails('Application Used:', item.applicationUsed),
            myText(item.otherDetails,
                fontWeight: FontWeight.bold,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                fontsize: 14,
                fontFamily: 'SofiaSans',
                alignment: Alignment.topLeft,
                color: Colors.black87),
          ],
        ),
      ),
    );
  }
}

boxDetails(String title, String description) => Card(
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    color: Colors.white,
    child: Column(children: [
      const SizedBox(height: 6),
      myText(title,
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          fontsize: 18,
          fontFamily: 'SofiaSans',
          maxLines: 100,
          alignment: Alignment.topLeft,
          color: Colors.black87),
      myText(description,
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          fontsize: 14,
          fontFamily: 'SofiaSans',
          maxLines: 100,
          alignment: Alignment.topLeft,
          color: Colors.black87),
      const SizedBox(height: 10),
    ]));

downloadButtons(BuildContext context, WorksModel item) {
  double width = context.isMobile ? 140 : 160;
  return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: [
          if (item.urlDownload.isNotEmpty)
            OnHover(
                miliseconds: 200,
                transform: Matrix4.identity(),
                builder: (isHovered) => myButton(
                      width: width,
                      action: () => launchUrl(Uri.parse(item.urlDownload)),
                      icon: Icons.download,
                      iconColor: isHovered ? Colors.white : Colors.black,
                      iconSize: 16,
                      label: myText('Download'),
                      background: isHovered ? Colors.black : Colors.transparent,
                      borderColor: Colors.black,
                      foreground: isHovered ? Colors.white : Colors.black,
                    )),
          if (item.urlLiveDemo.isNotEmpty)
            OnHover(
                miliseconds: 200,
                transform: Matrix4.identity(),
                builder: (isHovered) => myButton(
                      width: width,
                      action: () => launchUrl(Uri.parse(item.urlLiveDemo)),
                      icon: FontAwesomeIcons.link,
                      iconSize: 14,
                      label: myText('Live Demo'),
                      background: isHovered ? Colors.black : Colors.transparent,
                      borderColor: Colors.black,
                      foreground: isHovered ? Colors.white : Colors.black,
                    )),
          if (item.urlPlayStore.isNotEmpty)
            OnHover(
                miliseconds: 200,
                transform: Matrix4.identity(),
                builder: (isHovered) => myButton(
                      width: width,
                      action: () => launchUrl(Uri.parse(item.urlPlayStore)),
                      icon: FontAwesomeIcons.googlePlay,
                      iconSize: 14,
                      label: myText('Play Store'),
                      background: isHovered ? Colors.black : Colors.transparent,
                      borderColor: Colors.black,
                      foreground: isHovered ? Colors.white : Colors.black,
                    )),
          if (item.urlAppleStore.isNotEmpty)
            OnHover(
                miliseconds: 200,
                transform: Matrix4.identity(),
                builder: (isHovered) => myButton(
                      width: width,
                      action: () => launchUrl(Uri.parse(item.urlAppleStore)),
                      icon: FontAwesomeIcons.appStore,
                      iconSize: 16,
                      label: myText('Apple Store'),
                      background: isHovered ? Colors.black : Colors.transparent,
                      borderColor: Colors.black,
                      foreground: isHovered ? Colors.white : Colors.black,
                    ))
        ],
      ));
}
