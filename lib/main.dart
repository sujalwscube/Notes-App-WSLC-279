import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/AddNotes/blocs/addnotebloc.dart';
import 'package:notesapp_wslc_279/Screens/Homescreens/FetchNotes/Cubits/fetchnotescubit.dart';
import 'Screens/Login/Blocs/LogInBlocs.dart';
import 'Screens/Signup/Blocs/SignupBlocs.dart';
import 'Screens/Splash/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>LogInBlocs(),),
      BlocProvider(create: (_)=>SignUpBlocs(),),
      BlocProvider(create: (_)=>AddNoteBlocs()),
      BlocProvider(create: (_)=>FetchNotesCubit()..fetchNotes())
    ],
      child: const ScreenUtilInit(
        child: MaterialApp(
          title: 'Notes App',
          home: SplashScreen(),
        ),
      ),
    );
  }
}
