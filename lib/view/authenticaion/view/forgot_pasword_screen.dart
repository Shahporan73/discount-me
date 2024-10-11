// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/view/authenticaion/view/otp_verify_screen.dart';

class ForgotPaswordScreen extends StatelessWidget {
  const ForgotPaswordScreen({super.key});

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
                CustomAppBar(appBarName: "Forgot Password", onTap: () => Get.back(),),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppImages.forgotBg,
                              scale: 4,
                            ),
                            20.heightBox,
                            CustomText(
                              title:
                                  "Select which contact details should we use to reset your password",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                            
                            20.heightBox,

                            // Email Verification section
                            Container(
                              width: width,
                              padding:
                              EdgeInsets.symmetric(horizontal: 10.w, vertical: 24.h),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 40.r,
                                    backgroundColor: AppColors.orangeLightHover,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Icon(
                                        Icons.email,
                                        size: 32.w.h,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                  ),
                                  5.widthBox,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 10.w),
                                          child: CustomText(
                                            title: "Via Email",
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),

                                        5.heightBox,
                                        TextField(
                                          readOnly: false,
                                          maxLines: 1,
                                          style: GoogleFonts.urbanist(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18.sp,
                                            color: Colors.white, // Set text color to white
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "example@email.com",
                                            hintStyle: GoogleFonts.urbanist(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15.sp,
                                              color: Colors.grey, // Hint text color remains grey
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            20.heightBox,

                            GestureDetector(
                              onTap: () {
                                Get.to(OtpVerifyScreen());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: width,
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: CustomText(
                                  title: "Verify",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),












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
}
