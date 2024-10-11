

import 'package:discount_me_app/res/app_const/import_list.dart';

class Toastmessage {

  void showToast(context, msg) {
    VxToast.show(
        context,
        msg: msg,
      showTime: 1000,
      textColor: Colors.black,
      bgColor: Colors.white,
      textSize: 16
    );
  }

}
