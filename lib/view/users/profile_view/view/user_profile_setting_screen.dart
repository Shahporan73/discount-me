// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';

class UserProfileSettingScreen extends StatelessWidget {
  const UserProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(AppImages.homeBg),
            alignment: Alignment.topRight,
            opacity: 0.5),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // appBar
                  10.heightBox,
                  UserProfileAppbarWidget(title: "Setting", onTap: () => Get.back(),),

                  50.heightBox,
                  GestureDetector(
                    onTap: () {
                      Get.to(UserChangePasswordScreen());
                    },
                    child: changePasswordItem(),
                  ),


                  20.heightBox,
                  GestureDetector(
                    onTap: () {
                      showDeleteAccountAlertDialog(context);
                    },
                    child: deleteAccountItem(),
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget changePasswordItem(){
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.greenLight,
          borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              Icon(Icons.lock_outline, color: Colors.black,),

              15.widthBox,

              CustomText(title: "Change Password",
                fontSize: 16.sp, fontWeight: FontWeight.w500,
                color: Color(0xff727272),
              )
            ],
          ),

          Icon(Icons.navigate_next, size: 24,)

        ],
      ),
    );
  }
  Widget deleteAccountItem(){
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.greenLight,
          borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        children: [
          Icon(Icons.lock_outline, color: Colors.black,),

          15.widthBox,

          CustomText(title: "Delete Account",
            fontSize: 16.sp, fontWeight: FontWeight.w500,
            color: Color(0xff727272),
          )
        ],
      ),
    );
  }

  Future<void> showDeleteAccountAlertDialog(context){
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  title: 'Are you sure',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                10.heightBox,
                Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.60.w,
                  child: Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                                text: "All your changes will be",
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: Colors.black
                                )
                            ),
                            TextSpan(
                                text: " deleted ",
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: Color(0xffA020F0)
                                )
                            ),
                            TextSpan(
                                text: "and you will no longer be able to access them.",
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: Colors.black
                                )
                            ),

                          ]
                      )
                  ),
                ),

                15.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Closes the dialog
                      },
                      child: Text('No'),
                    ).box.color(Colors.white).border().width(Get.width*0.25).height(40).make(),

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Closes the dialog
                      },
                      child: Text('Yes', style: TextStyle(color: Colors.white),),
                    ).box.color(Colors.black).border().width(Get.width*0.25).height(40).make(),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }


}
