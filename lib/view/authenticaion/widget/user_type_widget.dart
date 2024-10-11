import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/authenticaion/controller/radio_button_controller.dart';
import 'package:discount_me_app/view/authenticaion/view/rider_sign_up_screen.dart';
import 'package:discount_me_app/view/authenticaion/view/vendor_sign_up_screen.dart';

class UserTypeWidget extends StatelessWidget {
  UserTypeWidget({super.key});
  final RadioController radioController = Get.put(RadioController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: width,
      alignment: Alignment.center,
      color: Colors.transparent, // Keep the container's color transparent
      child: Material(
        color: Colors.transparent, // Set Material's color to transparent
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // User Radio Button
              Obx(() => Row(
                children: [
                  Radio<String>(
                    value: "User",
                    groupValue: radioController.selectedRole.value,
                    onChanged: (value) {
                      radioController.changeRole(value!);
                      Get.to(UserSignUpScreen());
                    },
                    activeColor: const Color(0xffff7d29),
                  ),
                  CustomText(
                    title: "User",
                    fontSize: 16.sp,
                    color: radioController.selectedRole.value == "User"
                        ? const Color(0xffff7d29)
                        : Colors.white,
                  ),
                ],
              )),

              const SizedBox(width: 20), // Spacer between options

              // Driver Radio Button
              Obx(() => Row(
                children: [
                  Radio<String>(
                    value: "Rider",
                    groupValue: radioController.selectedRole.value,
                    onChanged: (value) {
                      radioController.changeRole(value!);
                      Get.to(RiderSignUpScreen());
                    },
                    activeColor: const Color(0xffff7d29), // Custom selected color for radio
                  ),
                  CustomText(
                    title: "Rider",
                    fontSize: 16.sp,
                    color: radioController.selectedRole.value == "Rider"
                        ? const Color(0xffff7d29) // Change text color when selected
                        : Colors.white, // Default color when not selected
                  ),
                ],
              )),

              const SizedBox(width: 20), // Spacer between options

              // Vendor Radio Button
              Obx(() => Row(
                children: [
                  Radio<String>(
                    value: "Vendor",
                    groupValue: radioController.selectedRole.value,
                    onChanged: (value) {
                      radioController.changeRole(value!);
                      Get.to(VendorSignUpScreen());
                    },
                    activeColor: const Color(0xffff7d29), // Custom selected color for radio
                  ),
                  CustomText(
                    title: "Vendor",
                    fontSize: 16.sp,
                    color: radioController.selectedRole.value == "Vendor"
                        ? const Color(0xffff7d29) // Change text color when selected
                        : Colors.white, // Default color when not selected
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
