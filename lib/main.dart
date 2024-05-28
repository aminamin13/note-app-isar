import 'package:flutter/material.dart';
import 'package:note_app_offline/models/note_database.dart';
import 'package:note_app_offline/pages/note_page.dart';
import 'package:provider/provider.dart';

void main() async {
  // initilize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initilize();

  runApp(ChangeNotifierProvider(create: (context) => NoteDatabase(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: NotePage(),
    );
  }
}
