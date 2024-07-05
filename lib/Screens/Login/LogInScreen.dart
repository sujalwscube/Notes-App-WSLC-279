import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/ui.helper.dart';
import '../Homescreens/HomeScreen.dart';
import '../Signup/SignUpScreen.dart';
import 'Blocs/LogInBlocs.dart';
import 'Blocs/LogInState.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController idController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool _obscureText = true;

  Color primary = Colors.redAccent;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = true;
    // KeyboardVisibilityProvider.isKeyboardVisible(context);

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: BlocConsumer<LogInBlocs, LogInStates>(listener: (context, state) {
        if (state is LogInLoadedStates) {
          Uihelper.CustomSnackbar(
              "User Logged in ${state.logInModel.data!.username}", context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        } else if (state is LogInErrorStates) {
          return Uihelper.CustomSnackbar(state.error, context);
        }
      }, builder: (context, state) {
        if (state is LogInLoadingStates) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              // if (!isKeyboardVisible)
              //   SizedBox(height: isKeyboardVisible ? 110 : 20),
              Container(
                height: screenHeight / 3,
                width: screenWidth,
                child: Center(
                  child: Image.asset(
                    'assets/images/Notelogo.png',
                    width: screenWidth / 1.5,
                    height: screenHeight / 3,
                  ),
                ),
              ),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight / 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fieldTile("Email Id"),
                    customField(
                      "Enter your Email Id",
                      idController,
                      false,
                    ),
                    fieldTile("Password"),
                    customField("Enter your Password", passController, true),
                    SizedBox(height: screenHeight / 50),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<LogInBlocs>(context).LogIn(
                            idController.text.toString(),
                            passController.text.toString());
                      },
                      child: Container(
                        height: 40.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.all(Radius.circular(32.r)),
                        ),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          // onTap: () {
                          //    Navigator.push(
                          //      context,
                          //      MaterialPageRoute(
                          //        builder: (context) => MyHomePage(),
                          //      ),
                          //    );
                          // },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 90.w),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
