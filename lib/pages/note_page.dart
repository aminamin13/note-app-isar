import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app_offline/components/note_settings.dart';
import 'package:note_app_offline/models/note_database.dart';
import 'package:note_app_offline/models/note_isar_init.dart';
import 'package:note_app_offline/models/theme_controller.dart';
import 'package:note_app_offline/theme/theme.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final textController = TextEditingController();

  @override
  @override
  void createNote() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('Create Note'),
          content: TextField(
            controller: textController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<NoteDatabase>().addNote(textController.text);
                textController.clear();
                // Clear the controller after creating a note
                Navigator.pop(context);
              },
              child: const Text(
                'Create',
              ),
            ),
          ],
        );
      },
    );
  }

  void readNote() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // update method

  void updateNote(Note note) {
    textController.text = note.text;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text('Update Note'),
          content: TextField(
            controller: textController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                context
                    .read<NoteDatabase>()
                    .updateNote(note.id, textController.text);
                textController.clear();
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  // delete method

  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  void initState() {
    super.initState();
    readNote();
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> currentNotes = noteDatabase.currentNotes;
    bool isDarkMode = Provider.of<ThemeController>(context).isDarkMode;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Note Page'),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                context.read<ThemeController>().toggleTheme();
              });
            },
          ),
          CupertinoSwitch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  context.read<ThemeController>().toggleTheme();
                });
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: ListView.builder(
        itemCount: currentNotes.length,
        itemBuilder: (context, index) {
          final note = currentNotes[index];
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(note.text, style: GoogleFonts.dmSerifText()),

              trailing: Builder(builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    showPopover(
                      width: 100,
                      height: 100,
                      arrowHeight: 10,
                      arrowWidth: 10,
                      
                      backgroundColor: Theme.of(context).colorScheme.background,
                      direction: PopoverDirection.bottom,
                      context: context,
                      bodyBuilder: (context) {
                        return NoteSettings(onDeleteTap: () {
                          deleteNote(note.id);
                        }, onUpdateTap: () {
                          updateNote(note);
                        });
                      },
                    );
                  },
                );
              }),

              // trailing: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     IconButton(
              //       icon: const Icon(Icons.edit),
              //       onPressed: () {
              //         updateNote(note);
              //       },
              //     ),
              //     IconButton(
              //       icon: const Icon(Icons.delete),
              //       onPressed: () {
              //         deleteNote(note.id);
              //       },
              //     ),
              //   ],
              // ),
            ),
          );
        },
      ),
    );
  }
}
