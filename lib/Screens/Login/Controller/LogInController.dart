import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/ui.helper.dart';
import '../Blocs/LogInBlocs.dart';

class LogInController {
  static LogIn(String email, String password, BuildContext context) {
    if (email == " " || password == " ") {
      return Uihelper.CustomSnackbar("Enter Required Field's", context);
    } else {
      context.read<LogInBlocs>().LogIn(email, password);
    }
  }
}
