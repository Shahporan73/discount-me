// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/country_code_picker.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/res/common_widget/custom_dotted_widget.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:discount_me_app/res/common_widget/picker_dialog.dart';
import 'package:discount_me_app/view/authenticaion/controller/radio_button_controller.dart';
import 'package:discount_me_app/view/authenticaion/view/sign_up_preview_screen.dart';
import 'package:discount_me_app/view/authenticaion/widget/password_widget.dart';
import 'package:discount_me_app/view/authenticaion/widget/upload_image_widget.dart';
import 'package:discount_me_app/view/authenticaion/widget/user_type_widget.dart';

class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({super.key});

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {

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




  final RadioController radioController = Get.put(RadioController());

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
//====================== App bar ==========================================
                    CustomAppBar(
                      appBarName: "Create Account",
                      onTap: () {
                        Get.back();
                      },
                    ),

//====================== Pick the Profile image ==========================================
                    20.heightBox,
                    Center(
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

/*================================= user type=================================================================================*/
                    10.heightBox,
                    UserTypeWidget(),

/*================================= Form section =================================================================================*/
                    10.heightBox,
                    Row(
                      children: [
                        Expanded
                          (child: CustomTextfieldWithLabel(
                          labelName: "First name",
                          hint: "First name",
                        ),
                        ),
                        10.widthBox,
                        Expanded
                          (child: CustomTextfieldWithLabel(
                          labelName: "Last name",
                          hint: "Last name",
                        ),
                        ),
                      ],
                    ),
                    CustomTextfieldWithLabel(
                      labelName: "Email address",
                      hint: "roy@roy.com",
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.black,),
                    ),

                    CustomTextfieldWithLabel(
                      labelName: "Location",
                      hint: "London park, UK",
                      prefixIcon: Icon(Icons.location_on_outlined, color: Colors.black,),
                    ),

                    //================ country code picker=======================
                    CountryCodePicker(),


                    20.heightBox,
                    Column(
                      children: [
                        CustomText(
                          title: "Are you a first responder or EBT card holder?(Optional)",
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
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
                            setState(() {
                              _selectedPosition = newValue;
                            });
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

                    20.heightBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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



//====================== Password section =======================
                    20.heightBox,
                    PasswordWidget(),

//====================== Password section =======================
                    20.heightBox,
                    GestureDetector(
                      onTap: () {
                        Get.to(SignUpPreviewScreen());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: width,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomText(
                          title: "Sign Up",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),

                    20.heightBox,
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

}
