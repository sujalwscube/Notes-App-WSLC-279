import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class uihelper {
  static CustomContainer(double height, double width, String text) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.2),

        borderRadius: const BorderRadius.all(Radius.circular(32),

      ),
      border: Border.all(color: Colors.white,width: 1)),


      child: Center(child: Text(text)),
    );
  }
   static CustomBigContainer(double height, double width,  Color color){
    return Container(
      height: height,
      width: width,
        decoration: BoxDecoration(
        color:color,

     borderRadius: const BorderRadius.all(Radius.circular(32),

     ),
        ),
    );
   }
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
