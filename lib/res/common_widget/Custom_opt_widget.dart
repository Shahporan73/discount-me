import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtpWidget extends StatelessWidget {
  final Color? pinColor;
  CustomOtpWidget({super.key, this.pinColor});

  @override
  Widget build(BuildContext context) {
    // Get the screen width for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    // Calculate how many OTP fields will fit based on screen width
    int fieldsPerRow = screenWidth > 600 ? 6 : 4; // Adjust for larger screens

    return Form(
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12.0, // Space between fields
            runSpacing: 12.0, // Space between rows
            children: List.generate(fieldsPerRow, (index) {
              return SizedBox(
                height: 64,
                width: screenWidth / fieldsPerRow - 24, // Adjust width dynamically
                child: TextFormField(
                  onSaved: (pin) {},
                  onChanged: (pin) {
                    if (pin.isNotEmpty) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: TextStyle(
                    color: pinColor ?? Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "0",
                    hintStyle: const TextStyle(color: Color(0xFF757575)),
                    border: authOutlineInputBorder,
                    enabledBorder: authOutlineInputBorder,
                    focusedBorder: authOutlineInputBorder.copyWith(
                        borderSide: const BorderSide(color: Color(0xFFFF7643))),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(12)),
);
