import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/AddNotes/addnotescreen.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/FetchNotes/Cubits/fetchnotescubit.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/FetchNotes/Cubits/fetchnotesstates.dart';
import '../../Widgets/ui.helper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: Colors.black,
          elevation: 0,
          title: Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/img.png'),
              ),
              const SizedBox(width: 10),
              const Center(
                child: Text(
                  'Hi, Priyanshu',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "mukta",
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.menu, size: 25, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                child: const Text(
                  'Drawer Header',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  // Handle logout action here
                  Navigator.pop(context); // Close the drawer
                  // Implement your logout logic, e.g., navigate to login screen
                },
              ),
            ],
          ),
        ),
        body: BlocBuilder<FetchNotesCubit,FetchNotesStates>(builder: (context,state){
          if(state is FetchNotesLoadingStates){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is FetchNotesLoadedStates){
            return ListView.builder(itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.shade100
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(state.getNotesModel.data![index].note.toString()),
                      Text(state.getNotesModel.data![index].created.toString()),

                    ],),
                  ),
                ),
              );
            },itemCount: state.getNotesModel.data!.length,);
          }
          else if(state is FetchNotesErrorStates){
            return Uihelper.CustomSnackbar(state.error.toString(), context);
          }
          return Center(child: Text("No Data Found!!"),);
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNoteScreen()));
          },
          child: const Icon(Icons.add),
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
