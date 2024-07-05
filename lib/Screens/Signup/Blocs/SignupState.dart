
import '../Models/signup.dart';

abstract class SignUpState{}
  class SignUpInitialStates extends SignUpState{}
  class SignUpLoadingStates extends SignUpState{}
   class SignUpLoadedStates extends SignUpState{
  SignUpModel signUpModels;
  SignUpLoadedStates({required this.signUpModels});
   }
   class SignUpErrorStates extends SignUpState{
  String error;
  SignUpErrorStates({required this.error});
   }



