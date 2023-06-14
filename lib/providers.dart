import 'package:flutter/cupertino.dart';
import 'package:madaapp/data/provider/local_auth_provider.dart';
import 'package:madaapp/injections.dart';
import 'package:madaapp/presentation/auth/login/view_model/login_view_model.dart';
import 'package:madaapp/presentation/home/view/view_model/home_view_model.dart';
import 'package:madaapp/presentation/profile/view/view_model/profile_view_model.dart';
import 'package:madaapp/presentation/splash/view_model/refresh_token_view_model.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context) => sl<LocalAuthProvider>()),
         ChangeNotifierProvider(create: (context) => sl<LoginViewModel>()),
     //    ChangeNotifierProvider(create: (context) => sl<RefreshTokenViewModel>()),
         ChangeNotifierProvider(create: (context) => sl<HomeViewModel>()),
         ChangeNotifierProvider(create: (context) => sl<ProfileViewModel>()),
       ],
      child: child,
    );
  }
}
