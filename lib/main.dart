import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:madaapp/binding/intialbindings.dart';
import 'package:madaapp/config/themes/theme_manager.dart';
import 'package:madaapp/core/services/getx_services/service.dart';
import 'package:madaapp/core/utils/constants.dart';
import 'package:madaapp/routes.dart';
import 'config/navigation/routes.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  MyServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale(
        'en',
      ),
      title: Constants.appName,
      initialBinding: InitialBindings(),
      initialRoute: Routes.splashScreen,
      getPages: routes,
      theme: getApplicationTheme(),

    );
  }
}
