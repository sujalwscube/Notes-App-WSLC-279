abstract class AddNotesEvents{}
class AddUserNotes extends AddNotesEvents{
  String note;
  AddUserNotes({required this.note});
}