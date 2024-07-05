import 'package:notesapp_wslc_279/Screens/Homescreens/AddNotes/Models/addnotemodel.dart';

abstract class AddNoteStates{}
class AddNoteInitialStates extends AddNoteStates{}
class AddNoteLoadingStates extends AddNoteStates{}
class AddNoteLoadedStates extends AddNoteStates{
  AddNoteModel addNoteModel;
  AddNoteLoadedStates({required this.addNoteModel});
}
class AddNoteErrorStates extends AddNoteStates{
  String error;
  AddNoteErrorStates({required this.error});
}