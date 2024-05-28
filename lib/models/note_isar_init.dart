import 'package:isar/isar.dart';

// this line is to generate the isar file
// then run: dart run build_runner build
part 'note_isar_init.g.dart';

@Collection()

class Note {
  Id id = Isar.autoIncrement;
    late String text;

}
