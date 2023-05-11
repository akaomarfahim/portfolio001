import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_final_omar/constants/def.dart';
import 'package:portfolio_final_omar/constants/root.dart';
import 'package:portfolio_final_omar/models/works_model.dart';
import 'package:portfolio_final_omar/providers/screen_provider.dart';
import 'package:portfolio_final_omar/utils/__screen.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__hover.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/widget_default/__text.dart';

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
    final EdgeInsets margin = Screen.isMobile(context) ? const EdgeInsets.fromLTRB(14, 0, 14, 6) : const EdgeInsets.fromLTRB(24, 0, 24, 6);

    return Container(
        color: Colors.grey.shade300,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () => context.read<ScreenProvider>().reset(),
                padding: const EdgeInsets.only(left: 20, top: 24, bottom: 10),
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.black)),
            if (item.imageUrl != null)
              Card(
                  margin: margin,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Def.cardBorderRadius)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(Def.cardBorderRadius), child: Image.network(item.imageUrl ?? FirebaseDataRoot.imageErrorLink, height: 300, width: double.infinity, fit: BoxFit.cover))),
            downloadButtons(context, item),
            MyText(item.title, fontFamily: 'Rubik', margin: margin, fontWeight: FontWeight.bold, fontSize: 24, alignment: Alignment.centerLeft, textColor: Colors.black),
            MyText(item.publisedDate, fontWeight: FontWeight.bold, margin: margin, fontSize: 12, fontFamily: 'SofiaSans', alignment: Alignment.topLeft, textColor: Colors.black45),
            MyText('Project Duration: ${item.projectDuration}',
                fontWeight: FontWeight.bold, margin: margin, fontSize: 14, fontFamily: 'SofiaSans', alignment: Alignment.topLeft, textColor: Colors.black87),
            boxDetails('Application Description', item.description ?? '', margin),
            boxDetails('Features', item.features ?? '', margin),
            boxDetails('Platforms Used:', item.projectPlatform ?? '', margin),
            Card(
                margin: margin,
                color: Colors.white,
                child: Padding(padding: const EdgeInsets.all(20), child: HtmlWidget(item.otherDetails ?? '', isSelectable: true, textStyle: const TextStyle(color: Colors.black)))),
          ],
        )));
  }
}

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
          if (item.urlDownload != null)
            OnHover(
                miliseconds: 200,
                transform: Matrix4.identity(),
                builder: (isHovered) => myButton(
                    width: width,
                    action: () => launchUrl(Uri.parse(item.urlDownload ?? '')),
                    icon: Icons.download,
                    iconColor: isHovered ? Colors.white : Colors.black,
                    iconSize: 16,                 
                    label: MyText('Download', textColor: isHovered ? Colors.white : Colors.black),
                    background: isHovered ? Colors.black : Colors.transparent,
                    borderColor: Colors.black,
                    foreground: isHovered ? Colors.white : Colors.black)),
          if (item.urlLiveDemo != null)   
            OnHover(
                miliseconds: 200,
                transform: Matrix4.identity(),
                builder: (isHovered) => myButton(
                    width: width,
                    action: () => launchUrl(Uri.parse(item.urlLiveDemo ?? '')),
                    icon: FontAwesomeIcons.link,
                    iconSize: 14,
                    label: MyText('Live Demo', textColor: isHovered ? Colors.white : Colors.black),
                    background: isHovered ? Colors.black : Colors.transparent,
                    borderColor: Colors.black,
                    foreground: isHovered ? Colors.white : Colors.black)),
          if (item.urlPlayStore != null)
            OnHover(
                miliseconds: 200,
                transform: Matrix4.identity(),
                builder: (isHovered) => myButton(
                    width: width,
                    action: () => launchUrl(Uri.parse(item.urlPlayStore ?? '')),
                    icon: FontAwesomeIcons.googlePlay,
                    iconSize: 14,
                    label: MyText('Play Store', textColor: isHovered ? Colors.white : Colors.black),
                    background: isHovered ? Colors.black : Colors.transparent,
                    borderColor: Colors.black,
                    foreground: isHovered ? Colors.white : Colors.black)),
          if (item.urlAppleStore != null)
            OnHover(
                miliseconds: 200,
                transform: Matrix4.identity(),
                builder: (isHovered) => myButton(
                    width: width,
                    action: () => launchUrl(Uri.parse(item.urlAppleStore ?? '')),
                    icon: FontAwesomeIcons.appStore,
                    iconSize: 16,
                    label: MyText('Apple Store', textColor: isHovered ? Colors.white : Colors.black),
                    background: isHovered ? Colors.black : Colors.transparent,
                    borderColor: Colors.black,
                    foreground: isHovered ? Colors.white : Colors.black))
        ],
      ));
}

boxDetails(String title, String description, EdgeInsets margin) => Card(
    margin: margin,
    color: Colors.white,
    child: Column(children: [
      const SizedBox(height: 6),
      MyText(title,
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          fontSize: 18,
          fontFamily: 'SofiaSans',
          maxLines: 100,
          alignment: Alignment.topLeft,
          textColor: Colors.black87),
      MyText(description,
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          fontSize: 14,
          fontFamily: 'SofiaSans',
          maxLines: 100,
          alignment: Alignment.topLeft,
          textColor: Colors.black87),
      const SizedBox(height: 10),
    ]));
