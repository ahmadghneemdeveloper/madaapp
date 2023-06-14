    import 'package:flutter/foundation.dart';
    import 'package:flutter/gestures.dart';
    import 'package:flutter/material.dart';
    import 'package:flutter/services.dart';
    import 'package:fluttertoast/fluttertoast.dart';
    import 'package:madaapp/config/navigation/navigation_services.dart';
    import 'package:madaapp/config/navigation/routes.dart';
    import 'package:madaapp/core/resources/app_colors.dart';
    import 'package:madaapp/core/services/responsive/num_extensions.dart';
    import 'package:madaapp/presentation/auth/login/components/input_field.dart';
    import 'package:madaapp/presentation/auth/login/view_model/login_view_model.dart';
    import 'package:madaapp/presentation/component/components.dart';
    import 'package:madaapp/presentation/component/custom_button.dart';
    import 'package:madaapp/presentation/home/view/pages/home_page.dart';
import 'package:madaapp/presentation/splash/view_model/refresh_token_view_model.dart';
    import 'package:provider/provider.dart';

    import '../../../../../data/models/base_response/response_model.dart';

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


      final GlobalKey<FormState> _key = GlobalKey<FormState>();
      final TextEditingController _phone_codeController = TextEditingController();
      final TextEditingController _phoneController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();

      Future<void> _submit(BuildContext context, LoginViewModel viewModel) async {
        if (kDebugMode) {
          ResponseModel responseModel = await viewModel.login(
            context: context,
            phone_code: "963",
            phone: '996664182',
            password: "123456789",
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePages(),
            ),
          );
          if (responseModel.isSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePages(),
              ),
            );

          }
        } else {
          FocusScope.of(context).unfocus();
          if (!_key.currentState!.validate()) {
            debugPrint("Form Not Valid");
            return;
          }
          _key.currentState!.save();
          ResponseModel responseModel = await viewModel.login(
            context: context,
            phone_code: _phone_codeController.text,
            phone: _phoneController.text,
            password: _passwordController.text,
          );
          if (responseModel.isSuccess) {

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePages(),
              ),
            );    }
        }
      }


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
        _phone_codeController.dispose();
        _phoneController.dispose();
      _passwordController.dispose();
        _controller.dispose();
        super.dispose();
      }

      @override
      Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: ScrollConfiguration(
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
                            InputField(),
                            inputField(
                                Icons.lock_outline, 'Password...', true, false),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Consumer<LoginViewModel>(
                                    builder: (context, viewModel, child) =>
                                        // CustomButton(
                                        //   loading: viewModel.isLoading,
                                        //   buttonText: 'Login',
                                        //   onTap: () => _submit(context, viewModel),
                                        // )
                                    ButtonLogin(
                                      'Login',
                                      1.2,
                                      () {
                                        print('ooook');
                                        _submit(context, viewModel);
                                        HapticFeedback.lightImpact();
                                        Fluttertoast.showToast(
                                            msg: 'Login button pressed');
                                      },
                                    )

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
      }

      Widget inputField(
          IconData icon, String hintText, bool isPassword, bool isPhone) {
        Size size = MediaQuery.of(context).size;
        return Container(
          height: size.width / 8,
          width: size.width / 1.22,
          alignment: Alignment.center,
          //padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            style: TextStyle(color: Colors.black.withOpacity(.8)),
            obscureText: isPassword,
            keyboardType: isPhone ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.black.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle:
                  TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
            ),
          ),
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
