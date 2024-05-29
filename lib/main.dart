import 'package:flutter/material.dart';
import 'package:note_app_offline/models/note_database.dart';
import 'package:note_app_offline/models/theme_controller.dart';
import 'package:note_app_offline/pages/note_page.dart';
import 'package:provider/provider.dart';

void main() async {
  // initilize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => NoteDatabase(),
    ),
    ChangeNotifierProvider(
      create: (context) => ThemeController(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeController>(context).theme,
      home: NotePage(),
    );
  }
}
