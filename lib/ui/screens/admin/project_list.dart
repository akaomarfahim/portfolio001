import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/root.dart';
import 'package:portfolio_final_omar/models/works_model.dart';
import 'package:portfolio_final_omar/ui/screens/admin/add_project.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:portfolio_final_omar/utils/__screen.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__network_image_view.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__text.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  bool isLoadingComplete = false;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    setState(() => isLoadingComplete = false);
    await WorksModel.getData();
    setState(() => isLoadingComplete = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: !isLoadingComplete
          ? const SplashScreen()
          : (WorksModel.items.isEmpty)
              ? Center(child: MyText('nothing to show', textColor: Colors.black))
              : SafeArea(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    child: Container(
                      alignment: Alignment.center,
                      width: Screen.isDesktop(context) ? Screen.width(context) * 0.40 : Screen.width(context),
                      child: RefreshIndicator(
                          onRefresh: () => loadData(),
                          child: ListView.builder(itemCount: WorksModel.items.length, itemBuilder: (context, index) => projectTile(WorksModel.items[index]))),
                    ),
                  ),
                ),
    );
  }

  projectTile(WorksModel item) => Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddProject(isEditMood: true, item: item))),
          child: ListTile(
            dense: true,
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            leading: SizedBox(child: myNetworkImage(width: 60, showloading: false, imageurl: item.imageUrl ?? FirebaseDataRoot.imageErrorLink, radius: 6, fit: BoxFit.cover)),
            title: MyText(item.title, textColor: Colors.black, fontWeight: FontWeight.bold, alignment: Alignment.centerLeft),
            subtitle: MyText(item.description, maxLines: 2, fontWeight: FontWeight.normal, textColor: Colors.black, alignment: Alignment.centerLeft),
            trailing: IconButton(
                onPressed: () async {
                  setState(() => isLoadingComplete = false);
                  await WorksModel.removeItem(item.key ?? -1);
                  loadData();
                },
                icon: const Icon(Icons.delete, color: Colors.red)),
          ),
        ),
      );
}
