import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:spned_wise_new/view/login/welcome_view.dart';

import 'common/color_extension.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   // options:DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Spen Wise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(
          seedColor: TColor.primary,
          background: TColor.gray80,
          primary: TColor.primary,
          primaryContainer: TColor.gray60,
          secondary: TColor.secondary,
        ),
        useMaterial3: false,
      ),
      home: const WelcomeView(),
    );
  }
}
