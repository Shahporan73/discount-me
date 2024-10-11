// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/users/home_view/view/order_complete_screen.dart';
import 'package:discount_me_app/view/users/home_view/view/recipes_screen.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_resturant_app_bar.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

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
                children: [
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
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

                      GestureDetector(
                        onTap: () {
                          Get.to(UserNotificationScreen());
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.primaryColor,
                              boxShadow: const [
                                BoxShadow(color: AppColors.whiteColor,
                                    blurRadius: 10, offset: Offset(0, 1))
                              ]
                          ),
                          child: Icon(Icons.notifications, color: AppColors.whiteColor, size: 20.sp,),
                        ),
                      ),
                    ],
                  ),



                  // add order.......
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "Order details",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.blackColor,
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: GestureDetector(
                          onTap: () {
                            Get.to(RecipesScreen());
                          },
                          child: Container(
                            padding:EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Row(
                              children: [
                                CustomText(
                                  title: "Add More",
                                  color: AppColors.whiteColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                Icon(Icons.add, color: AppColors.whiteColor,)
                              ],
                            ),
                          ),
                        )
                      )
                    ],
                  ),

                  20.heightBox,
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8.w),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.07),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Product Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.asset(
                              AppImages.burgerCard, // Replace with your image path
                              scale: 4,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12.w),

                          // Product details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chicken Burger',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'Burger Factory LTD',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'Rs 200',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Quantity Selector
                          Row(
                            children: [
                              // Minus Button
                              Container(
                                height: 32.h,
                                width: 32.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.greenLightHover,
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(Icons.remove, color: AppColors.primaryColor),
                                  onPressed: () {
                                    // Reduce item quantity logic here
                                  },
                                ),
                              ),
                              SizedBox(width: 8.w),
                              // Quantity
                              Text(
                                '1', // Quantity value (replace with dynamic value)
                                style: GoogleFonts.urbanist(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 8.w),

                              // Plus Button
                              Container(
                                height: 32.h,
                                width: 32.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.primaryColor,
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(Icons.add, color: Colors.white),
                                  onPressed: () {
                                    // Increase item quantity logic here
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                    },
                  ),

                  20.heightBox,
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.green, // Set your primary color here
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: AssetImage(AppImages.orderBg), // Replace with your background image
                        fit: BoxFit.cover,
                        opacity: 0.3,
                        colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.dstATop),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Sub-Total, Delivery Charge, Discount, Total
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sub-Total',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xfffefeff), // Set text color to #fefeff
                                  ),
                                ),
                                Text(
                                  'Rs 950',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xfffefeff), // Set text color to #fefeff
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery Charge',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xfffefeff), // Set text color to #fefeff
                                  ),
                                ),
                                Text(
                                  'Rs 50',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xfffefeff), // Set text color to #fefeff
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discount',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xfffefeff), // Set text color to #fefeff
                                  ),
                                ),
                                Text(
                                  'Rs 0',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xfffefeff), // Set text color to #fefeff
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: GoogleFonts.manrope(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xfffefeff), // Set text color to #fefeff
                                  ),
                                ),
                                Text(
                                  'Rs 1,000',
                                  style: GoogleFonts.manrope(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xfffefeff), // Set text color to #fefeff
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.center,
                          child: Roundbutton(
                            title: "Place My Order",
                            titleColor: AppColors.primaryColor,
                            borderRadius: 8.r,
                            buttonColor: AppColors.whiteColor,
                            onTap: () {
                              Get.to(OrderCompleteScreen());
                           },
                          ),
                        ),
                      ],
                    ),
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
