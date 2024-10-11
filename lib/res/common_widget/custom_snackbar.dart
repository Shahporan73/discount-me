
import 'package:discount_me_app/res/app_const/import_list.dart';

class CustomSnackBar {
  void customSnackBar(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

}