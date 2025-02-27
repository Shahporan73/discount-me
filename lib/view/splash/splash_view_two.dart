// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';

class SplashViewTwo extends StatelessWidget {
  const SplashViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: width,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Image.asset(AppImages.discountMeLogo, scale: 4,),
                  ),
                  30.heightBox,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      AppImages.eatingDonutBro,
                      scale: 4,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 30, right: 30,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Roundbutton(
                borderRadius: 4.r,
                title: "Lets go",
                onTap: () {
                  Get.to(
                      ()=>
                      WelcomeScreen(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 500)
                  );
              },)
            ),
          )
        ],
      ),
    );
  }
}
