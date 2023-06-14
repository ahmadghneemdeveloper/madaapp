import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madaapp/config/navigation/navigation_services.dart';
import 'package:madaapp/core/resources/app_assets.dart';
import 'package:madaapp/core/resources/app_colors.dart';
import 'package:madaapp/core/services/responsive/num_extensions.dart';
import 'package:madaapp/presentation/component/components.dart';
import '../../../../config/navigation/routes.dart';

class TravelerInput extends StatefulWidget {
  const TravelerInput({Key? key}) : super(key: key);

  @override
  State<TravelerInput> createState() => _TravelerInputState();
}

class _TravelerInputState extends State<TravelerInput> {
  var email;
  var password;
  bool passToggle = true;
  int _selectedButton = 1;
  Uint8List? _file;
  late DateTime _selectedDate=DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        //colors
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff4f45ac),
              Color(0xff19153f),
            ],
          ),
        ),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            //appBar
            Stack(
              children: [
                Container(
                  height: 220.h,
                  width: double.infinity,
                  color: ColorManager.colorCode343434,
                ),
                Center(
                  child: SizedBox(
                    height: 220.h,
                    width: double.infinity,
                    child: const CustomAssetsImage(
                        image: AssetsManager.world, boxFit: BoxFit.fitWidth),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomAssetsImage(
                      image: AssetsManager.notfication,
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0.h),
                      child: Column(
                        children: [
                          CustomText(
                              text: 'بيانات المسافرين',
                              textStyle: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold)),
                          VerticalSpace(20.h),
                          CustomAssetsImage(
                            image: AssetsManager.inputplanicone,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigationService.goBack(context);
                      },
                      child: const CustomAssetsImage(
                        image: AssetsManager.backicon,
                      ),
                    )
                  ],
                ),
              ],
            ),

            //body

            Padding(
              padding: EdgeInsets.only(top: 10.0.h),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                              text: 'اللقب',
                              textStyle: TextStyle(
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp)),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0.h),
                            child: Container(
                              height: size.width / 8,
                              width: 100.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorManager.colorButton,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                style:
                                    const TextStyle(color: ColorManager.gray),
                                decoration: InputDecoration(
                                  suffixIcon: Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                            text: 'اللقب',
                                            textStyle: TextStyle(
                                                color: ColorManager.gray,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5.w),
                                              child: Icon(Icons.personal_injury,
                                                  color: ColorManager.gray),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                              text: 'الاسم',
                              textStyle: TextStyle(
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp)),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0.h),
                            child: Container(
                              height: size.width / 8,
                              width: 200.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorManager.colorButton,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                style:
                                    const TextStyle(color: ColorManager.gray),
                                decoration: InputDecoration(
                                  suffixIcon: Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                            text: 'الاسم',
                                            textStyle: TextStyle(
                                                color: ColorManager.gray,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5.w),
                                              child: Icon(Icons.personal_injury,
                                                  color: ColorManager.gray),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  VerticalSpace(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                            text: 'تاريخ الميلاد',
                            textStyle: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp)),
                        Container(
                          height: size.width / 8,
                          width: size.width / 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorManager.colorButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            readOnly: true,
                            textAlign: TextAlign.right,
                            style: const TextStyle(color: ColorManager.white),
                            decoration: InputDecoration(
                              suffixIcon: Row(
                                children: [
                                  InkWell(
                                      onTap: () {  _selectDate(context);},
                                      child: Stack(alignment: Alignment.center,
                                        children: [

                                          Container(
                                            width: 35.w,
                                            color: ColorManager.gray,
                                          ),

                                          Center(
                                            child: Icon(Icons.calendar_month,
                                                color: ColorManager.color363782,size: 30.sp),
                                          )
                                        ],

                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(left: 190.0.w),
                                    child: Row(
                                      children: [
                                        CustomText(
                                            text:_selectedDate == null
                                                ? 'Select a Date'
                                                : '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                            textStyle: TextStyle(
                                                color: ColorManager.gray,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp)),
                                        Icon(Icons.spatial_tracking_outlined,
                                            color: ColorManager.gray),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                            text: 'محل الميلاد',
                            textStyle: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp)),
                        Container(
                          height: size.width / 8,
                          width: size.width / 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorManager.colorButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            textAlign: TextAlign.right,
                            style: const TextStyle(color: ColorManager.white),
                            decoration: InputDecoration(
                              suffixIcon: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 160.0.w),
                                    child: Row(
                                      children: [
                                        CustomText(
                                            text: 'يرجى تحديد محل الميلاد',
                                            textStyle: TextStyle(
                                                color: ColorManager.gray,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp)),
                                        TapEffect(
                                          onClick: (){},
                                          child: Icon(Icons.location_pin,
                                              color: ColorManager.gray),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(20.h),
                  //male or famele
                  Padding(
                    padding: EdgeInsets.only(right: 20.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                            text: 'الجنس',
                            textStyle: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _selectedButton = 1;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: _selectedButton == 1
                                    ? ColorManager.colorFBB0CE
                                    : ColorManager.colorgray3,
                                onPrimary: ColorManager.white,
                                side: const BorderSide(
                                    color: ColorManager.white, width: 1.0),
                              ),
                              child: const Text('انثى'),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _selectedButton = 2;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: _selectedButton == 2
                                    ? ColorManager.colorFBB0CE
                                    : ColorManager.colorgray3,
                                onPrimary: ColorManager.white,
                                side: const BorderSide(
                                    color: ColorManager.white, width: 1.0),
                              ),
                              child: const Text('ذكر'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(20.h),
                  //Job
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                            text: 'المهنة',
                            textStyle: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp)),
                        Container(
                          height: size.width / 8,
                          width: size.width / 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorManager.colorButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            textAlign: TextAlign.right,
                            style: const TextStyle(color: ColorManager.white),
                            decoration: InputDecoration(
                              suffixIcon: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 260.0.w),
                                    child: Row(
                                      children: [
                                        CustomText(
                                            text: 'المهنة',
                                            textStyle: TextStyle(
                                                color: ColorManager.gray,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp)),
                                        Icon(Icons.personal_injury,
                                            color: ColorManager.gray),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(20.h),
                  //number passport
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                            text: 'رقم جواز السفر',
                            textStyle: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp)),
                        Container(
                          height: size.width / 8,
                          width: size.width / 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorManager.colorButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            textAlign: TextAlign.right,
                            style: const TextStyle(color: ColorManager.white),
                            decoration: InputDecoration(
                              suffixIcon: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 210.0.w),
                                    child: Row(
                                      children: [
                                        CustomText(
                                            text: 'رقم جواز السفر',
                                            textStyle: TextStyle(
                                                color: ColorManager.gray,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp)),
                                        Icon(Icons.spatial_tracking_outlined,
                                            color: ColorManager.gray),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(20.h),
                  //image to passport
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                            text: 'صورة جواز السفر',
                            textStyle: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp)),
                        Container(
                          height: size.width / 8,
                          width: size.width / 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorManager.colorButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            readOnly: true,
                            textAlign: TextAlign.right,
                            style: const TextStyle(color: ColorManager.white),
                            decoration: InputDecoration(
                              suffixIcon: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 70.w,
                                        color: ColorManager.gray,
                                      ),
                                      InkWell(
                                        onTap: ()=>SelectPhoto(context),
                                        child: Center(
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 5.0.w),
                                            child: CustomText(
                                              text: 'إستعراض',
                                              textStyle: TextStyle(
                                                  color: ColorManager.color363782,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 65.0.w),
                                    child: Row(
                                      children: [
                                        CustomText(
                                            text: 'يرجى إدراج صورة جواز السفر',
                                            textStyle: TextStyle(
                                                color: ColorManager.gray,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp)),
                                        Icon(
                                            Icons
                                                .account_balance_wallet_rounded,
                                            color: ColorManager.gray),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpace(20.h),
                  Button('حفظ بيانات المسافر', 1.2, () {
                    HapticFeedback.lightImpact();

                    NavigationService.pushReplacement(context, Routes.travelerdata);
                  }, ColorManager.gray),
                  VerticalSpace(20.h),
                ],
              ),
            )
          ]),
        )),
      ),
    );
  }


  Widget Button(
      String string, double width, VoidCallback voidCallback, Color? colors) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: voidCallback,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: Container(
          height: size.width / 8,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.arrow_circle_left_outlined,
                color: ColorManager.color363782,
              ),
              SizedBox(
                width: 150.w,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  string,
                  style: TextStyle(
                      color: ColorManager.color363782,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('No Image Selected');
  }
  SelectPhoto(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('صورة جواز السفر'),
          children: <Widget>[
            //************ post write
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Text('الكاميرا'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),

            //***********take aphoto as post
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: Text('الأستديو'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: Text("إالغاء"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );


      },
    );
  }

}
