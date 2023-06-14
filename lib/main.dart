import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/config/navigation/route_generator.dart';
import 'package:madaapp/config/themes/theme_manager.dart';
import 'package:madaapp/core/utils/constants.dart';
import 'package:madaapp/providers.dart';
import 'package:provider/provider.dart';

import 'config/navigation/routes.dart';
import 'injections.dart' as di;

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await di.init();

  runApp(
    const AppProviders(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
