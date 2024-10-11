

import 'package:discount_me_app/res/app_const/import_list.dart';

class Roundbutton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isLoading = false;
  final double width;
  final double padding_vertical;
  final double borderRadius;
  final Color? buttonColor;
  final BoxBorder? border;
  final Color? titleColor;
  const Roundbutton({
    super.key,
    required this.title,
    required this.onTap,
    isLoading,
    this.width=380,
    this.padding_vertical = 18.0,
    this.borderRadius = 25.0,
    this.buttonColor = AppColors.secondaryColor,
    this.border,
    this.titleColor=Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color:buttonColor,
            borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),

        width: width,
        padding: EdgeInsets.symmetric(vertical: padding_vertical.h),
        child:  Text(
          title,
          style: GoogleFonts.urbanist(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            color: titleColor
          ),
        )
      ),
    );
  }
}
// isLoading == true ? Center(child: const CircularProgressIndicator(color: Colors.green,)) :