import '../Models/fetchnotesmodel.dart';

abstract class FetchNotesStates{}
class FetchNotesInitialStates extends FetchNotesStates{}
class FetchNotesLoadingStates extends FetchNotesStates{}
class FetchNotesLoadedStates extends FetchNotesStates{
  GetNotesModel getNotesModel;
  FetchNotesLoadedStates({required this.getNotesModel});
}
class FetchNotesErrorStates extends FetchNotesStates{
  String error;
  FetchNotesErrorStates({required this.error});
}