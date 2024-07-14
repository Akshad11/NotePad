import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/pages/components/datamodel.dart';
import 'package:noteapp/pages/splashscreen.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBn23vzo6Yf5RbKbnVVBHbYXuZsTVJ3Bpk',
        appId: '1:722892651162:android:20d4036db92620a4f8bd23',
        messagingSenderId: '722892651162',
        projectId: 'jp22-63cab',
        storageBucket: 'jp22-63cab.appspot.com',
      )
  );
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
