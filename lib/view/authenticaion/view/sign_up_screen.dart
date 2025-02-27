// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/country_code_picker.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/res/common_widget/custom_dotted_widget.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:discount_me_app/res/custom_style/custom_size.dart';
import 'package:discount_me_app/view/authenticaion/controller/radio_button_controller.dart';
import 'package:discount_me_app/view/authenticaion/view/sign_up_preview_screen.dart';
import 'package:discount_me_app/view/authenticaion/widget/password_widget.dart';
import 'package:discount_me_app/view/authenticaion/widget/user_type_widget.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends StatelessWidget {
  final RadioController radioController = Get.put(RadioController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    // This list holds US civil services and official positions.
    final List<String> _positions = [
      'Federal Government Official',
      'State Government Official',
      'City Council Member',
      'Mayor',
      'Senator',
      'Congressperson',
      'Police Officer',
      'Firefighter',
      'Public School Teacher',
      'Healthcare Worker',
      'Other'
    ];
    // Initial selected value
    String? _selectedPosition;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.authBg),
              fit: BoxFit.fill,
              opacity: 0.3,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // app bar
                  CustomAppBar(
                    appBarName: "Create Account",
                    onTap: () {
                      Get.back();
                    },
                  ),


                  /// pick image
                  20.heightBox,
                 AnimatedContainer(
                     duration: Duration(seconds: 5),
                   width: width,
                   curve: Curves.easeIn,
                   child:Obx(() => Visibility(
                     visible: radioController.selectedRole.value == "User" ||
                         radioController.selectedRole.value == "Rider",
                     child: Center(
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
                   ),),
                 ),



                  /// UserTypeWidget to select the user role
                  20.heightBox,
                  UserTypeWidget(),

                  /// get details
                  20.heightBox,
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User" ||
                        radioController.selectedRole.value == "Rider" ||
                        radioController.selectedRole.value == "Vendor",
                    child: Column(
                      children: [
                        radioController.selectedRole.value == "Vendor"?
                        CustomTextfieldWithLabel(
                        labelName: "Restaurant Name",
                          hint: 'Kings food',
                        )
                        :Row(
                          children: [
                            Expanded(
                              child: CustomTextfieldWithLabel(
                                labelName: "First name",
                                hint: "Ryan",
                              ),
                            ),
                            10.widthBox,
                            Expanded(
                              child: CustomTextfieldWithLabel(
                                labelName: "Last name",
                                hint: "Renold",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),),


                  /// resturant description for vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "Vendor",
                    child: CustomTextfieldWithLabel(
                      labelName: "Restaurant Description",
                      hint: 'Enter description...',
                    ),
                  ),),

                  /// contact for user, rider and vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User" ||
                        radioController.selectedRole.value == "Rider" ||
                      radioController.selectedRole.value == "Vendor",
                    child: CustomTextfieldWithLabel(
                      labelName: "Email address",
                      hint: 'abc@gmailc.com',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),),

                  /// contact for user, rider and vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User" ||
                        radioController.selectedRole.value == "Rider" ||
                        radioController.selectedRole.value == "Vendor",
                    child: CustomTextfieldWithLabel(
                      labelName: "Location",
                      hint: 'New york, usa',
                      prefixIcon: Icon(Icons.location_on_outlined),
                    ),
                  ),),

                  /// contact for user, rider and vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User" ||
                        radioController.selectedRole.value == "Rider" ||
                        radioController.selectedRole.value == "Vendor",
                    child: CountryCodePicker(),
                  ),),

                  /// Ebt holder for user
                  20.heightBox,
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User",
                    child:   Column(
                      children: [
                        CustomText(
                          title: "Are you a first responder or EBT card holder?(Optional)",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        10.heightBox,
                        DropdownButtonFormField<String>(
                          value: _selectedPosition,
                          dropdownColor: Colors.white,  // Dropdown menu background color
                          style: TextStyle(
                            color: Colors.black,  // Selected item text color
                          ),
                          hint: Text(
                            'Select an option',
                            style: TextStyle(color: Colors.black),  // Hint text color
                          ),
                          items: _positions.map((position) {
                            return DropdownMenuItem(
                              value: position,
                              child: Text(
                                position,
                                style: TextStyle(color: Colors.black),  // Dropdown item text color
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            _selectedPosition = newValue;
                            // setState(() {
                            //   _selectedPosition = newValue;
                            // });
                          },
                          decoration: InputDecoration(
                            filled: true,  // Enables background fill
                            fillColor: Colors.white,  // Set the background fill color to white
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.secondaryColor),
                                borderRadius: BorderRadius.all(Radius.circular(8.r))
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                          ),
                        )
                      ],
                    ),
                  ),),


                  /// document verify for user
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.heightBox,
                        CustomText(
                          title: "Please upload documents to verify",
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                        10.heightBox,
                        CustomDottedWidget(
                          dottedColor: Colors.white,
                          textColor: Colors.white,
                          buttonColor: Colors.white,
                          onTap: () {
                            PickerDialog().showDocumentPickerDialog(context);
                          },
                        )
                      ],
                    ),
                  ),),

                  /// document verify for rider
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "Rider",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                  ),),

                 /// Upload Cover Photo for Vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "Vendor",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Upload Cover Photo",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: AppColors.whiteColor,
                        ),
                        10.heightBox,
                        CustomDottedWidget(
                            dottedColor: Colors.white,
                            buttonColor: Colors.white,
                            textColor: Colors.white,
                            onTap: () => PickerDialog().showImagePickerDialog(context)
                        ),
                      ],
                    ),
                  ),),

                  /// Upload Cover Photo for Vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "Vendor",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.heightBox,
                        CustomText(
                          title: "Upload Tax Document",
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
                      ],
                    ),
                  ),),

                  /// contact for user and rider and vendor
                  20.heightBox,
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User" ||
                        radioController.selectedRole.value == "Rider" ||
                        radioController.selectedRole.value == "Vendor",
                    child:  PasswordWidget(),
                  ),),



                  // Sign Up Button
                  20.heightBox,
                  Roundbutton(
                    title: 'Sign Up',
                    onTap: () {
                      Get.to(
                              ()=>SignUpPreviewScreen(),
                      );
                    },
                  ),
                  20.heightBox,

                  Center(
                    child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Already have an account? ',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white
                                  )
                              ),
                              TextSpan(
                                text: 'Log In',
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.secondaryColor
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(()=>SignInScreen());
                                  },
                              )
                            ]
                        )
                    ),
                  ),

                  heightBox20

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
