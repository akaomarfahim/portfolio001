import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/routes.dart';
import 'package:portfolio_final_omar/firebase_options.dart';
import 'package:portfolio_final_omar/providers/screen_provider.dart';
import 'package:portfolio_final_omar/ui/home/portfolio.dart';
import 'package:portfolio_final_omar/ui/screens/splash_screen.dart';
import 'package:portfolio_final_omar/utils/__colors.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';

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
      theme: ThemeData(primaryColor: generateMaterialColor(color: MyColors.primary)),
      darkTheme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(selectionColor: Colors.black, selectionHandleColor: Colors.black),
          primaryTextTheme: const TextTheme(titleMedium: TextStyle(fontFamily: 'RobotoSlab')),
          primaryColor: generateMaterialColor(color: MyColors.primary),
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red, secondary: MyColors.accent),
          textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'RobotoSlab'))),
      initialRoute: MyRoutes.portfolio,
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.portfolio: (context) => const Portfolio(),
      },
    );
  }
}
