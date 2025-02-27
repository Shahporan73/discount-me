// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/authenticaion/view/broker_sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a duration of 2 seconds
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    // Define the animation range from 0 (left) to 1 (right)
    _animation = Tween<double>(begin: -1, end: 1.5).animate(_controller);

    // Set up the controller to repeat the animation forward and reverse (ping-pong)
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              AppImages.welcomeBgMain,
              width: width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(AppImages.discountMeLogo),
                  ),
                  const SizedBox(height: 20),
                  CustomText(
                    title: "Let’s get started!",
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: const Color(0xff1D242D),
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    title: "Login to Stay healthy and fit ",
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: AppColors.darkShadeBlue,
                  ),
                  const SizedBox(height: 20),
                  Roundbutton(
                    width: width,
                    padding_vertical: 15.h,
                    borderRadius: 6,
                    buttonColor: AppColors.primaryColor,
                    title: "Login",
                    onTap: () {
                      Get.to(
                              () => SignInScreen(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 500)
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Get.to(
                              () => SignUpScreen(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 500)
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 1, color: AppColors.secondaryColor)),
                        width: width,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.urbanist(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondaryColor),
                        )),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Get.to(BrokerSignUpScreen());
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "If you want to work with us ",
                              style: GoogleFonts.urbanist(
                                  color: AppColors.darkShadeBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp)),
                          TextSpan(
                              text: "Click Here",
                              style: GoogleFonts.urbanist(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp)
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add the animated motorcycle at the bottom
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              bool isMovingLeft = _controller.status == AnimationStatus.reverse;
              String imagePath = isMovingLeft
                  ? AppImages.discountMeBikeRight // Image for right-to-left
                  : AppImages.discountMeBike; // Image for left-to-right

              return Positioned(
                bottom: 0,
                left: _animation.value * (width - 100), // Moves motorcycle left to right and back
                child: Image.asset(imagePath, scale: 4),
              );
            },
          ),
        ],
      ),
    );
  }
}
