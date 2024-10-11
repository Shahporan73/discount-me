// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/splash/splash_view_two.dart';

class SplashViewOne extends StatelessWidget {
  SplashViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.deliciousVitaminFood),
          fit: BoxFit.fill,
          opacity: 0.5,
            colorFilter: ColorFilter.mode(
                Colors.black,
                BlendMode.dstATop
            )
        ),
      ),

      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Image.asset(AppImages.discountMeLogo),
                  ),
                  30.heightBox,
                  CustomText(
                    title: " No Worry, Handle Your Hunger with",
                    fontWeight: FontWeight.w400,
                    fontSize: 24.sp,
                    color: Colors.white,
                  ),
                  5.heightBox,
                  CustomText(
                    title: "Discount me",
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),

          Positioned(
            bottom: width < 600? 40.h:0,
              left: 0, right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [

                   Container(
                     width: width.w,
                     alignment: Alignment.center,
                     margin: EdgeInsets.symmetric(horizontal: 50.w),
                     child:  Text(
                       textAlign: TextAlign.center,
                       "Discount Me come to help you hunger problem with easy find any restaurant",
                       style: GoogleFonts.urbanist(
                         fontWeight: FontWeight.w400,
                         fontSize: 15.sp,
                         color: Colors.white,
                         decoration: TextDecoration.none, height: 1.5
                       ),
                     ),
                   ),
                    20.heightBox,
                    GestureDetector(
                      onTap: (){
                        Get.to(SplashViewTwo());
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(Icons.arrow_forward, color: Colors.white, size: 28.w.h,),
                      ),
                    ),

                  ],
                )


              ),
          )
        ],
      )

    );
  }
}