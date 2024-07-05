import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Homescreens/HomeScreen.dart';
import '../../Login/LogInScreen.dart';

class SplashControllers{
  static CheckUser(BuildContext context)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    bool? islogin=prefs.getBool("islogin");
    if(islogin!=null){
      if(islogin){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyHomePage()));

      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginscreen()));

      }
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
    }
  }
}