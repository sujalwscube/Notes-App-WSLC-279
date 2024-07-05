import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/AddNotes/blocs/addnotebloc.dart';

import '../../../../Widgets/ui.helper.dart';

class AddNoteController {
  static addnote(String note, BuildContext context) {
    if (note == "") {
      return Uihelper.CustomSnackbar("Enter Required Field's", context);
    } else {
      context.read<AddNoteBlocs>().addnote(note);

    }
  }
}
