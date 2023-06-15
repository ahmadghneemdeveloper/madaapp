import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/config/navigation/routes.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/auth/login/components/input_field.dart';
import 'package:madaapp/presentation/auth/login/components/input_password.dart';
import 'package:madaapp/presentation/auth/login/controller/login_controller.dart';
import 'package:madaapp/presentation/component/components.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;


  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });

    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Form(
                key:controller.formKey,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: size.height,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff473e9c),
                            Color(0xff0d0942),
                          ],
                        ),
                      ),
                      child: Opacity(
                        opacity: _opacity.value,
                        child: Transform.scale(
                          scale: _transform.value,
                          child: Container(
                            width: size.width * .9,
                            height: size.width * 1.1,
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.1),
                                  blurRadius: 90,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: ColorManager.colorCode343434,
                                  ),
                                ),
                                InputField(
                                    controller: controller.phone,
                                    onChanged: (value) {
                                      controller.onChanageFlag(value);
                                    }),
                                InputPassword(
                                  icon: Icons.lock_outline,
                                  hintText: 'Password...',
                                  isPassword: true,
                                  isPhone: false,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ButtonLogin(
                                      'Login',
                                      1.2,
                                      () {
                                        controller.registerRepo();

                                        HapticFeedback.lightImpact();
                                        Fluttertoast.showToast(
                                            msg: 'Login button pressed');
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(),
                                TapEffect(
                                  onClick: () {
                                    NavigationService.pushReplacementAll(
                                        context, Routes.registerpage);
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'Don\'t have an account?',
                                          style: const TextStyle(
                                            color: ColorManager.colorCode343434,
                                            fontSize: 15,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Fluttertoast.showToast(
                                                msg: 'Create a new Account',
                                              );
                                            },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      TapEffect(
                                        onClick: () {
                                          NavigationService.push(
                                              context, Routes.registerpage);
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Sign Up',
                                            style: TextStyle(
                                              color: ColorManager.colorCodeFCBD5D,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget ButtonLogin(String name, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: voidCallback,
      child: Container(
        height: size.width / 8,
        width: size.width / width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorManager.colorCodeFCBD5D,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
