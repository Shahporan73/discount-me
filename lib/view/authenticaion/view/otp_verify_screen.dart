// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/res/custom_style/custom_size.dart';
import 'package:discount_me_app/view/authenticaion/view/create_new_password_screen.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../res/common_widget/Custom_opt_widget.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.authBg),
          fit: BoxFit.fill,
          opacity: 0.3,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                CustomAppBar(
                    appBarName: "Otp Verify",
                  onTap: () {
                    Get.back();
                  },
                ),

                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                AppImages.otpBg,
                                scale: 4,
                              ),
                            ),
                            20.heightBox,
                            CustomText(
                              title:
                              "Code has been send to abc@gmail.com",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),


                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomOtpWidget(),
                              ],
                            ),


                            // Timeout section
                            20.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  title: "Resend code in ",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  title: "53",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: AppColors.secondaryColor,
                                ),
                                CustomText(
                                  title:  " s",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            20.heightBox,

                            Roundbutton(
                              buttonColor: AppColors.secondaryColor,
                              width: width,
                              title: "Confirm", onTap: () {
                                Get.to(()=>CreateNewPasswordScreen());
                              },
                            )



                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _otp_package_widget(context){
    return OtpTextField(
      numberOfFields: 4,
      textStyle: TextStyle(fontSize: 26, color: Colors.black),
      fieldWidth: 80.w,
      filled: true,
      fillColor: Colors.white,
      borderColor: Colors.transparent,
      focusedBorderColor: AppColors.secondaryColor,
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },

      //runs when every textfield is filled
      onSubmit: (String verificationCode){
        showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Verification Code"),
                content: Text('Code entered is $verificationCode'),
                actions: [
                  TextButton(onPressed: () {
                    Get.back();
                  }, child: Text("Ok"))
                ],
              );
            }
        );

      }, // end onSubmit
    );
  }
}
