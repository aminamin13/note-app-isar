import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  NoteSettings(
      {super.key, required this.onDeleteTap, required this.onUpdateTap});
  void Function()? onDeleteTap;
  void Function()? onUpdateTap;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onUpdateTap!();
          },
          child: Container(
            color: Theme.of(context).colorScheme.background,
            height: 50,
            child: Center(child: Text("Update")),
          )),
      GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onDeleteTap!();
          },
          child: Container(
            color: Theme.of(context).colorScheme.background,
            height: 50,
            child: Center(child: Text("Delete")),
          )),
    ]);
  }
}
