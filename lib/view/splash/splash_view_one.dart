// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';

class SplashViewOne extends StatelessWidget {
  SplashViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffE6F7ED),
              Color(0xff006A2B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1],
          ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: Get.height / 10,
          ),
          Image.asset(AppImages.deliciousVitaminFood),
          SizedBox(
            height: 15,
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Image.asset(AppImages.discountMeLogo),
                  ),
                  20.heightBox,
                  CustomText(
                    title: "No Worry, Handle Your Hunger with",
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    color: Color(0xff727272),
                  ),
                  5.heightBox,
                  CustomText(
                    title: "Discount me",
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    color: Color(0xff727272),
                  ),
                ],
              ),
            ],
          )),

          Column(
            children: [

              Container(
                width: Get.width,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 50),
                child:  Text(
                  textAlign: TextAlign.center,
                  "Discount Me come to help you hunger problem with easy find any restaurant",
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      height: 1.5
                  ),
                ),
              ),
              20.heightBox,
              GestureDetector(
                onTap: (){
                  Get.to(()=> SplashViewTwo(), duration: Duration(milliseconds: 100)
                  );
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
          ),
          
        ],
      )

    );
  }
}

