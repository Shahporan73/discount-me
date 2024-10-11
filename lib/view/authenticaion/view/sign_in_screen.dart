// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:discount_me_app/view/authenticaion/controller/auth_controller.dart';
import 'package:discount_me_app/view/authenticaion/controller/password_controller.dart';
import 'package:discount_me_app/view/authenticaion/view/forgot_pasword_screen.dart';
import 'package:discount_me_app/view/users/home_view/view/user_home_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final PasswordController passwordController = Get.put(PasswordController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.authBg),
            fit: BoxFit.fill,
            opacity: 0.3,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomAppBar(
                appBarName: "Login Account",
                onTap: () {
                  Get.back();
                  },
                ),
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(AppImages.loginBg),
                          CustomTextfieldWithLabel(
                            labelName: "Email address",
                            hint: "Enter email",
                            controller: authController.emailController,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon:
                            Icon(Icons.email_outlined, color: Colors.black),
                          ),
                          CustomText(
                            title: "Password",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.whiteColor,
                          ),
                          SizedBox(height: 10),

                          // Obx only wraps the part where observable value is used
                          Obx(() => TextField(
                            controller: authController.passwordController,
                            obscureText: !passwordController.isPasswordVisible.value,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Enter password",
                              hintStyle: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(Icons.lock_outline, color: Colors.black,),
                              fillColor: AppColors.whiteColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.r)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
                                  borderRadius: BorderRadius.circular(8.r)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passwordController.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: passwordController.togglePasswordVisibility,
                              ),
                            ),
                          )),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Get.to(ForgotPaswordScreen());
                            },
                            child: Container(
                              width: width,
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // Wrap only the part that depends on the observable value with Obx
                        GestureDetector(
                            onTap: () {
                              // Handle login action
                              authController.getLogin();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: width,
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: CustomText(
                                title: "Log In",
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
    );
  }
}

