import 'package:discount_me_app/res/app_const/import_list.dart';

class CreatePasswordController extends GetxController{

  var isNewPasswordVisible = false.obs;   // For first password field
  var isNewConfirmPasswordVisible = false.obs; // For confirm password field

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleNewConfirmPasswordVisibility() {
    isNewConfirmPasswordVisible.value = !isNewConfirmPasswordVisible.value;
  }
}