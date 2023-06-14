import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/components.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorCode343434,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                children: [
                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.only(left: 38.0),
                    child: CustomText(
                        text: "الأعدادات",
                        textStyle: TextStyle(
                            color: ColorManager.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                  //  CustomSvgImage(image: AssetsManager.appIcon, height: 50.h),

                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                    color: ColorManager.white,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                child: Column(
                  children: [
                    SettingsGroup(
                        title: "GeneraL",
                        subtitleTextStyle:
                            const TextStyle(color: ColorManager.colorCode5E57BE),
                        children: <Widget>[
                          const SizedBox(
                            height: 8,
                          ),
                          buildLanguage(),
                          //buildSecurity(context),
                          buildDeleteAccount(),
                          buildLogout(),
                        ]),
                    const SizedBox(
                      height: 12,
                    ),
                    SettingsGroup(
                        title: "Feedback",
                        subtitleTextStyle:
                            const TextStyle(color: ColorManager.colorCode5E57BE),
                        children: <Widget>[
                          const SizedBox(
                            height: 8,
                          ),
                          //  buildReportBug(context),
                          buildSendFeedback(context),
                          buildPrivacy(context),
                        ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildLogout() => SimpleSettingsTile(
      title: "Logout",
      subtitle: '',
      leading: const Icon(
        Icons.logout,
        color: Colors.blueAccent,
      ),
      onTap: () async {});

  Widget buildDeleteAccount() => SimpleSettingsTile(
      title: "Delete",
      subtitle: '',
      leading: const Icon(
        Icons.delete,
        color: Colors.pink,
      ),
      onTap: () async {
        AwesomeDialog(
          btnOkColor: const Color(0xff241fb6),
          context: context,
          dialogBackgroundColor: const Color(0xff09071c),
          dialogType: DialogType.QUESTION,
          animType: AnimType.BOTTOMSLIDE,
          title: ' Delete the account',
          desc: 'Do you really want to delete the account',
          descTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          btnOkOnPress: () {},
          btnCancelOnPress: () {
            Navigator.pop(context);
          },
        ).show();

        //showSnackBar(context, 'Clicked Delete Account');
      });

  Widget buildSendFeedback(BuildContext context) => SimpleSettingsTile(
      title: "SendFeed",
      subtitle: '',
      leading: const Icon(
        Icons.thumb_up,
        color: Colors.purple,
      ),
      onTap: () {});

  Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
        title: "PrivcyPolicy",
        leading: const Icon(
          Icons.lock,
          color: Colors.blue,
        ),
        onTap: () {},
      );

  var select;

  buildLanguage() => DropdownSearch(
        mode: Mode.BOTTOM_SHEET,
        showSearchBox: true,
        showSelectedItems: true,
        items: const ["Arabic", "English"],
        searchFieldProps: const TextFieldProps(cursorColor: ColorManager.colorCode5E57BE),
        dropdownSearchDecoration: const InputDecoration(
            labelText: "Selecte Language",
            labelStyle: TextStyle(color:ColorManager.colorCode5E57BE)),
        onChanged: (selectedBlock) {
          setState(() {
            select = selectedBlock;
            //   language.setLanguage(select);
          });
        },
      );
}
