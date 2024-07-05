import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:notesapp_wslc_279/Screens/Homescreens/AddNotes/Models/addnotemodel.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/AddNotes/blocs/addnoteevents.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/AddNotes/blocs/addnotestates.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Utills/baseurl.dart';

class AddNoteBlocs extends Bloc<AddNotesEvents, AddNoteStates> {
  AddNoteBlocs() : super(AddNoteInitialStates());
  addnote(String note) async {
    emit(AddNoteLoadingStates());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString("userid");
    String? token = prefs.getString("token");
    final response = await http.post(Uri.parse(BaseUrl.addnote),
        headers: {"Content-Type": "application/json", "Authorization": token!},
        body: jsonEncode({"user": userid, "note": note}));

    if (response.statusCode == 200) {
      Map<String, dynamic> responsedata = jsonDecode(response.body);
      AddNoteModel addNoteModel = AddNoteModel.fromJson(responsedata);
      log(responsedata.toString());
      emit(AddNoteLoadedStates(addNoteModel: addNoteModel));
    } else {
      Map<String, dynamic> responseerror = jsonDecode(response.body);
      String error = responseerror['message'];
      emit(AddNoteErrorStates(error: error));
    }
  }
}
