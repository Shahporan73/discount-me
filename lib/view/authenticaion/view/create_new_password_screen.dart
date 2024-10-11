// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/view/authenticaion/view/sign_in_screen.dart';
import 'package:discount_me_app/view/authenticaion/widget/create_password_widget.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

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
                  appBarName: "Create New Password",
                  onTap: () {
                    Get.back();
                  },
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

                            Image.asset(
                              AppImages.createPassBg,
                              scale: 4,
                            ),

                            20.heightBox,
                            CreatePasswordWidget(),

                            30.heightBox,
                            Roundbutton(
                              borderRadius: 8,
                              padding_vertical: 15,
                              buttonColor: AppColors.secondaryColor,width: width,
                              title: "Confirm", onTap: () {
                                Get.to(SignInScreen());
                                },
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
