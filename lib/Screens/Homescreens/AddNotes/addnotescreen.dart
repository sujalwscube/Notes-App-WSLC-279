import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/AddNotes/Controllers/addnotecontroller.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/AddNotes/blocs/addnotebloc.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/AddNotes/blocs/addnotestates.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/FetchNotes/Cubits/fetchnotescubit.dart';
import 'package:notesapp_wslc_279/Widgets/ui.helper.dart';

class AddNoteScreen extends StatelessWidget {
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Notes"),
        centerTitle: true,
      ),
      body: BlocConsumer<AddNoteBlocs,AddNoteStates>(
        listener: (context,state){
          if(state is AddNoteLoadedStates){
            Uihelper.CustomSnackbar(state.addNoteModel.message.toString(), context);
          }
          else if(state is AddNoteErrorStates){
            Uihelper.CustomSnackbar(state.error.toString(), context);
          }
        },
        builder: (context,state){
          if(state is AddNoteLoadingStates){
            return Center(child: CircularProgressIndicator(),);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.CustomTextField(noteController, "Enter a Note", Icons.note),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {
                AddNoteController.addnote(noteController.text.toString(), context);
                context.read<FetchNotesCubit>().fetchNotes();
                Navigator.pop(context);
              }, child: Text("Add Note"))
            ],
          );
        }
        ,
      )
    );
  }
}
