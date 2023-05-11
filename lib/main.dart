import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/routes.dart';
import 'package:portfolio_final_omar/providers/screen_provider.dart';
import 'package:portfolio_final_omar/ui/home/portfolio.dart';
import 'package:portfolio_final_omar/ui/screens/admin/add_project.dart';
import 'package:portfolio_final_omar/ui/screens/admin/admin.dart';
import 'package:portfolio_final_omar/ui/screens/admin/login.dart';
import 'package:portfolio_final_omar/ui/screens/admin/project_list.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Firebase.initializeApp();
  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //   setWindowTitle('Omar Fahim');
  //   setWindowMinSize(const Size(400, 700));
  //   setWindowMaxSize(Size.infinite);
  // }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ScreenProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Omar Fahim',
      themeMode: ThemeMode.dark,
      theme: ThemeData(primaryColor: MyColors.primary, fontFamily: 'Rubik'),
      darkTheme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.blue.withOpacity(0.3), selectionHandleColor: Colors.blue.withOpacity(0.3)),
          primaryTextTheme: const TextTheme(titleMedium: TextStyle(fontFamily: 'RobotoSlab')),
          primaryColor: generateMaterialColor(color: MyColors.primary),
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.blueGrey, secondary: MyColors.accent),
          textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'RobotoSlab'))),
      initialRoute: MyRoutes.portfolio,
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.portfolio: (context) => const Portfolio(),
        MyRoutes.login: (context) => const Login(),
        MyRoutes.admin: (context) => const Admin(),
        MyRoutes.newProject: (context) => const AddProject(),
        MyRoutes.newBlog: (context) => const Login(),
        MyRoutes.worksList: (context) => const ProjectList(),
      },
    );
  }
}
