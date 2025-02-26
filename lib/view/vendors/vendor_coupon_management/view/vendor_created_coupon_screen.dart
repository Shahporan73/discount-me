// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/users/coupon_view/view/payment_method_screen.dart';

import 'vendor_edit_coupon_screen.dart';

class VendorCreatedCouponScreen extends StatelessWidget {
  const VendorCreatedCouponScreen({super.key});

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
                  // 10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back, color: Colors.black, size: 28,),
                            ) ,
                            // Centering the logo using Expanded and Align
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  AppImages.discountMeLogo,
                                  scale: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.lightBlueAccent,
                        ),
                        child: Image.asset(
                          AppImages.homeProfileAvatar,
                          scale: 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  Roundbutton(
                      title: "Create Coupon Card",
                      buttonColor: AppColors.secondaryColor,
                      titleColor: Colors.white,
                      borderRadius: 8.r,
                      onTap: () {
                        Get.to(
                                () => VendorEditCouponScreen(),
                            transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 500),
                        );
                      },
                  ),

                  SizedBox(height: 20.h),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            // Get.to(()=>PaymentMethodScreen());
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                AppImages.couponBg, // Replace with your image path
                                scale: 4,
                              ),
                              Positioned.fill(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Price Section
                                    Padding(
                                      padding: EdgeInsets.only(left: 40.w), // Responsive padding using ScreenUtil
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Price',
                                            style: GoogleFonts.urbanist(
                                              color: Colors.green,
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            '\$10.99',
                                            style: GoogleFonts.urbanist(
                                              color: Colors.orange,
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Discount Info Section
                                    Padding(
                                      padding: EdgeInsets.only(right: 40.w), // Responsive padding using ScreenUtil
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Single Discount',
                                            style: GoogleFonts.urbanist(
                                              color: Colors.black,
                                              fontSize: 20.sp, // Responsive font size using ScreenUtil
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          5.heightBox,
                                          Text(
                                            'Customer takes 6 discount',
                                            style: GoogleFonts.urbanist(
                                              color: AppColors.whiteNormalActive,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp, // Responsive font size using ScreenUtil
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
