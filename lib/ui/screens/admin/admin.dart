import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_final_omar/models/user_model.dart';
import 'package:portfolio_final_omar/ui/screens/admin/add_project.dart';
import 'package:portfolio_final_omar/ui/screens/admin/edit_about.dart';
import 'package:portfolio_final_omar/ui/screens/admin/edit_education.dart';
import 'package:portfolio_final_omar/ui/screens/admin/project_list.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:portfolio_final_omar/utils/__screen.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';
import 'add_blog.dart';
import 'auth.dart';
import 'blog_list.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextStyle textStyle = const TextStyle(fontFamily: 'Rubik', fontSize: 18, color: Colors.white);
  int selectedIndex = 0;
  bool isLoadingComplete = false;
  bool showMenu = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    if (mounted) setState(() => isLoadingComplete = false);
    // debugPrint('User Data :');
    // debugPrint(UserModel.user.username);
    // debugPrint(UserModel.user.password);
    // try {
    //   if (UserModel.isLoggedIn() == false) {
    //     // Get.toNamed('/login');
    //   } else {
    //     if (await auth(UserModel.user.username ?? '', UserModel.user.password ?? '') == false) Get.toNamed('/login');
    //   }
    // } catch (e) {
    //   debugPrint('My ERRROR :$e');
    // }

    if (await auth(UserModel.user.username ?? '', UserModel.user.password ?? '') == false) Get.toNamed('/login');

    // // debugPrint('Admin page logged in');
    if (mounted) setState(() => isLoadingComplete = true);
  }

  final adminPages = {
    'Add New Project': const AddProject(),
    'Project List': const ProjectList(),
    'Add New Blog': const AddBlog(),
    'Blog List': const BlogList(),
    'Edit About': const EditAbout(),
    'Edit Education': const EditEducation(),
  };

  @override
  Widget build(BuildContext context) {
    if (Screen.isDesktop(context) | Screen.isTablet(context)) showMenu = true;
    return Scaffold(
        body: !isLoadingComplete
            ? const SplashScreen()
            : Stack(
                children: [
                  Row(
                    children: [
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: Screen.isMobile(context)
                              ? showMenu
                                  ? 200
                                  : 0
                              : 200,
                          padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                          color: Colors.grey.shade300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListView.builder(
                                  itemCount: adminPages.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => myButton(
                                      action: () => setState(() => [selectedIndex = index, showMenu = false]),
                                      height: 40,
                                      borderRadius: 6,
                                      label: Text(adminPages.keys.toList()[index], style: textStyle)))
                            ],
                            // children: adminPages.keys
                            //     .toList()
                            //     .map((key) => Container(child: myButton(action: () => setState(() => selectedIndex = key), height: 40, borderRadius: 6, label: Text('Add New Blog', style: textStyle))))
                            //     .toList()
                          )),
                      Expanded(
                          child: Container(
                              color: Colors.grey.shade300,
                              padding: const EdgeInsets.fromLTRB(6, 16, 6, 0),
                              child: IndexedStack(index: selectedIndex, children: adminPages.values.toList())))
                    ],
                  ),
                  if (Screen.isMobile(context)) IconButton(onPressed: () => setState(() => showMenu = !showMenu), icon: const Icon(Icons.menu_rounded, color: Colors.amber)),
                ],
              ));
  }
}
