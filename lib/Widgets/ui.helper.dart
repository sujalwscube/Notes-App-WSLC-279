import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class uihelper {
  static Widget CustomContainer({
    required double height,
    required double width,
    required String text,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget CustomBigContainer({
    required double height,
    required double width,
    required Color color,
    Color? shadowColor,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.black.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }
}

// final uihelper = UiHelper();


class Uihelper {
  static CustomTextField(
      TextEditingController controller, String text, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
      ),
    );
  }

  static CustomSnackbar(String text, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Colors.blue,
    ));
  }
}

Widget fieldTile(String title) {
  return Container(
    margin: EdgeInsets.only(bottom: 8.h),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Color primary = Colors.redAccent;
bool _obscureText = true;
Widget customField(

    String hint, TextEditingController controller, bool obscure) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 16.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(12.r)),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.r,
          offset: const Offset(2, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 50.w,
          child: Icon(
            hint == 'Enter your Password' ? Icons.lock : Icons.email,
            color: primary,
            size: 24.sp,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: TextFormField(
              controller: controller,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
                border: InputBorder.none,
                hintText: hint,
              ),
              maxLines: 1,
              obscureText: obscure && _obscureText,
            ),
          ),
        ),
        if (hint == 'Enter your Password')
          IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: primary,
            ),
            onPressed: () {

                _obscureText = !_obscureText;

            },
          ),
      ],
    ),
  );
}

// Container(
// height: 100,
// width: 100,
// decoration: BoxDecoration(
// color: Colors.grey,
// shape: BoxShape.circle,
// ),
// child: Center(child: Text('Box')),
// );
