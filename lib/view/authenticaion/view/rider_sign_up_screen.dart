// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/country_code_picker.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/res/common_widget/custom_dotted_widget.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:discount_me_app/res/common_widget/picker_dialog.dart';
import 'package:discount_me_app/view/authenticaion/controller/radio_button_controller.dart';
import 'package:discount_me_app/view/authenticaion/view/sign_up_preview_screen.dart';
import 'package:discount_me_app/view/authenticaion/widget/password_widget.dart';
import 'package:discount_me_app/view/authenticaion/widget/upload_image_widget.dart';
import 'package:discount_me_app/view/authenticaion/widget/user_type_widget.dart';

class RiderSignUpScreen extends StatelessWidget {
  RiderSignUpScreen({super.key});

  final RadioController radioController = Get.put(RadioController());

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
      child: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
//====================== App bar ==========================================
                  CustomAppBar(
                    appBarName: "Create Account",
                    onTap: () {
                      Get.back();
                    },
                  ),

//====================== Pick the Profile image ==========================================
                  20.heightBox,
                  Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          AppImages.imagePickerIcon,
                          scale: 4.w.h,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => PickerDialog().showImagePickerDialog(context),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.secondaryColor,
                                size: 28.w.h,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

/*================================= user type=================================================================================*/
                  10.heightBox,
                  UserTypeWidget(),

/*================================= Form section =================================================================================*/
                  10.heightBox,
                  Row(
                    children: [
                      Expanded
                        (child: CustomTextfieldWithLabel(
                          labelName: "First name",
                        hint: "First name",
                      ),
                      ),
                      10.widthBox,
                      Expanded
                        (child: CustomTextfieldWithLabel(
                          labelName: "Last name",
                        hint: "Last name",
                      ),
                      ),
                    ],
                  ),

                  CustomTextfieldWithLabel(
                    labelName: "Email address",
                    hint: "roy@roy.com",
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.black,),
                  ),

                  CustomTextfieldWithLabel(
                    labelName: "Location",
                    hint: "London park, UK",
                    prefixIcon: Icon(Icons.location_on_outlined, color: Colors.black,),
                  ),

                  //================ country code picker=======================
                  CountryCodePicker(),


                  //====================== Upload Tax Document section =======================
                  20.heightBox,
                  CustomText(
                    title: "Upload driving license",
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                  10.heightBox,
                  CustomDottedWidget(
                      dottedColor: Colors.white,
                      buttonColor: Colors.white,
                      textColor: Colors.white,
                      onTap: () => PickerDialog().showDocumentPickerDialog(context)
                  ),

//====================== Password section =======================
                  20.heightBox,
                  PasswordWidget(),

//====================== Password section =======================
                  20.heightBox,
                  GestureDetector(
                    onTap: () {
                      Get.to(SignUpPreviewScreen());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(8.r)
                      ),
                      child: CustomText(
                        title: "Sign Up",
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),

                  20.heightBox,
                ],
              ),
            )
        ),
      ),
    );
  }


}
