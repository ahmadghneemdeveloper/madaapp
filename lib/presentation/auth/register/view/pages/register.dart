import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/config/navigation/routes.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/auth/login/components/input_field.dart';
import 'package:madaapp/presentation/component/components.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;
  var phone = "";

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
 // String phoneNumber ='+963996664182';
  final auth=FirebaseAuth.instance;
 // final phoneNumberController =TextEditingController();
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
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.colorCode343434,
                          ),
                        ),
                        inputField(
                            Icons.person_outline, 'UserName', false, false),
                        // InputField(),
                        inputField(
                            Icons.lock_outline, 'Password...', true, false),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonLogin('Sign Up', 1.2, ()async {



                              print('0000000000$phone');
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                autoRetrievedSmsCodeForTesting:"teeeesting " ,
                                timeout: Duration(seconds: 60),
                                phoneNumber: '+963996664182',
                                verificationCompleted: (PhoneAuthCredential credential) async{
                                  print("This User is authenticated by google play services");
                                  FirebaseAuth.instance.signInWithCredential(credential)
                                      .then((result) =>{
                                    if(result != null && result.user != null){
                                      print("Authentication is Successful")
                                    }else{
                                      print("Authentication failed!")
                                    }
                                  })
                                      .catchError((error){
                                    print(error);
                                  });
                                },
                                verificationFailed: (FirebaseAuthException e) {
                                  print('11111$phone');
                                },
                                codeSent: (String verificationId, int? resendToken) {
                                  print("Code Sent");
                                  print("Code $verificationId");
                                  print("Code $resendToken");

                                 // NavigationService.pushReplacement(context, Routes.myotp);
                                },
                                codeAutoRetrievalTimeout: (String verificationId) {
                                  print('222222222$phone');
                                });
                           }

                            )
                          ],
                        ),
                        // const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Already have an account ? ',
                                style: const TextStyle(
                                  color: ColorManager.colorCode343434,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            TapEffect(
                              onClick: () {
                                NavigationService.push(
                                    context, Routes.loginScreen);
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: ColorManager.colorCodeFCBD5D,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(),
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

  Widget ButtonLogin(String string, double width, VoidCallback voidCallback) {
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
          string,
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
//
//
// final FirebaseAuth _auth = FirebaseAuth.instance;
//
// Future<void> verifyPhone(
//     String phone,
//     void Function(String id) getVerificationId,
//
//     ) async {
//   await _auth.verifyPhoneNumber(
//     phoneNumber: phone,
//     timeout: const Duration(minutes: 1),
//     verificationCompleted: (PhoneAuthCredential credential) {
//       // log("${credential.smsCode}");
//     },
//     verificationFailed: (FirebaseAuthException e) {
//       // log("error: $e");
//       //verificationFailed(e);
//     },
//     codeSent: (String verificationId, int? resendToken) {
//       // log("$verificationId -- $resendToken");
//       getVerificationId(verificationId);
//     },
//     codeAutoRetrievalTimeout: (String verificationId) {
//       // log("timeout: $verificationId");
//     },
//   );
// }
// _otpPhoneAction(BuildContext context) async {
//   SignInOtpViewModel? signInOtpViewModel = Provider.of(
//     context,
//     listen: false,
//   );
//
//   var phoneNumber =
//       "+963956155975";
//   await verifyPhone(phoneNumber, (verificationId) {
//     signInOtpViewModel?.isLoading = false;
//     Navigator.pop(context);
//     // showModalBottomSheet(
//     //   context: context,
//     //   isScrollControlled: true,
//     //   isDismissible: false,
//     //   shape: const RoundedRectangleBorder(
//     //       // borderRadius:
//     //       // BorderRadius.vertical(top: Radius.circular(MAIN_RADIUS * 2))
//     //   ),
//     // //  builder: (_) => SMSCodeInput(verificationId: verificationId),
//     // );
//   }
//   );
//

//}