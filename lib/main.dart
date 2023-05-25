import 'package:material_color_generator/material_color_generator.dart';
import 'package:portfolio_final_omar/models/user_model.dart';
import 'package:portfolio_final_omar/providers/screen_provider.dart';
import 'package:portfolio_final_omar/ui/screens/admin/admin.dart';
import 'package:portfolio_final_omar/ui/screens/admin/login.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:portfolio_final_omar/ui/screens/unknown_page.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'landing_page.dart';

void main() async {
  setPathUrlStrategy();
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Omar Fahim | Portfolio',
      themeMode: ThemeMode.dark,
      theme: ThemeData(primaryColor: MyColors.primary, fontFamily: 'Rubik'),
      darkTheme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.blue.withOpacity(0.3), selectionHandleColor: Colors.blue.withOpacity(0.3)),
          primaryTextTheme: const TextTheme(titleMedium: TextStyle(fontFamily: 'RobotoSlab')),
          primaryColor: generateMaterialColor(color: MyColors.primary),
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.blueGrey, secondary: MyColors.accent),
          textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'RobotoSlab'))),
      initialRoute: '/',
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 20),
      unknownRoute: GetPage(name: '/error', page: () => const UnknownPage()),
      getPages: [
        GetPage(name: '/', page: () => const WelcomeScreen(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 20)),
        GetPage(name: '/login', page: () => const Login(), transition: Transition.fadeIn, curve: Curves.linear, transitionDuration: const Duration(milliseconds: 20)),
        GetPage(
            name: '/admin',
            // page: () {
            //   debugPrint('User Data :');
            //   debugPrint(UserModel.user.username);
            //   debugPrint(UserModel.user.password);
            //   if (UserModel.isLoggedIn() == true) {
            //     return const Admin();
            //   }
            //   return const Login();
            // },
            page: () => adminLoginCheck(),
            transition: Transition.fadeIn,
            curve: Curves.linear,
            transitionDuration: const Duration(milliseconds: 20)),
        GetPage(name: '/:pageName', page: () => const LandingPage(), transition: Transition.fadeIn, curve: Curves.linear, transitionDuration: const Duration(milliseconds: 20)),
        GetPage(
            name: '/:pageName/:pageData',
            page: () => const LandingPage(),
            transition: Transition.fadeIn,
            curve: Curves.linear,
            transitionDuration: const Duration(milliseconds: 20)),
      ],
    );
  }
}

adminLoginCheck() async {
  debugPrint('User Data :');
  debugPrint(UserModel.user.username);
  debugPrint(UserModel.user.password);
  if (UserModel.isLoggedIn() == true) {
    const Admin();
  } else {
    Get.toNamed('/login');
  }
}
