import 'package:flutter/material.dart';
import 'package:noteapp/pages/components/datamodel.dart';
import 'package:noteapp/pages/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers:[
      ChangeNotifierProvider<NotesData>(create :(context){
        return NotesData();
      })],
          child : const MyApp()
      )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
