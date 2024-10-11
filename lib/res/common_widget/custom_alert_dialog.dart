
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAlertDialog {


  Future<void> customAlert(context){
    return  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Column(
            children: [
              Text('Are you sure',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget> [

                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Closes the dialog
                    },
                    child: Text('No'),
                  ).box.color(Colors.white).border().width(Get.width*0.25).height(40).make(),

                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Closes the dialog
                    },
                    child: Text('Yes', style: TextStyle(color: Colors.white),),
                  ).box.color(Colors.black).border().width(Get.width*0.25).height(40).make(),
                ],
              )
            ],
          ).box.color(Colors.white).height(Get.height * 0.12).make(),
        );
      },
    );
  }


  Future<void> onSuccessAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // insert a message
              Icon(Icons.done,size: 60,),
              10.heightBox,
                TextButton(onPressed: (){
                  Navigator.pop(context);
                  },
                  child: Text("Payment successfully done ",
                    style: GoogleFonts.urbanist(
                  fontSize: 16.sp,
                  color: Colors.black, fontWeight: FontWeight.w400
                    ),
                  ),
                ),

            ],
          ).box.color(Colors.white).height(Get.height * 0.15).make(),
        );
      },
    );
  }

  void showRejectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Are you sure you want to reject the order request?'),
          actions: [
            TextButton(
              onPressed: () {
                // Action to take when "Cancel" is pressed
                Navigator.of(context).pop(); // Closes the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                // Action to take when "Sure" is pressed
                Navigator.of(context).pop(); // Closes the dialog
                // Add rejection logic here
              },
              child: Text('Sure?', style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }

  // for logout dialog
  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(SignInScreen());
              },
              child: Text("Logout", style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the color to red
              ),
            ),
          ],
        );
      },
    );
  }

}
