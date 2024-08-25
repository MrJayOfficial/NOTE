import 'package:note/model/notemodel.dart';
import 'package:hive/hive.dart';

class DataBase {
  //reference of the box
  final db = Hive.box('notebox');

  List<NoteModel> alltask = [
    const NoteModel(task: 'ajfdakdf', taskDescription: 'ajdfkajdf'),
    const NoteModel(task: 'ajfdakdf', taskDescription: 'ajdfkajdf'),
    const NoteModel(task: 'ajfdakdf', taskDescription: 'ajdfkajdf')
  ];

  void getData() {
    alltask = db.get('database');
  }

  void update() {
    db.put('database', alltask);
  }
}
