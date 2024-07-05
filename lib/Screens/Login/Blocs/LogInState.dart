import 'package:flutter/cupertino.dart';

import '../Model/LogInModel.dart';
abstract class LogInStates{}
class LogInInitialStates extends LogInStates{}
class LogInLoadingStates extends LogInStates{}
class LogInLoadedStates extends LogInStates{
  LogInModel logInModel;
  LogInLoadedStates({required this.logInModel});

}
class LogInErrorStates extends LogInStates{
  String error;
  LogInErrorStates({required this.error});
}