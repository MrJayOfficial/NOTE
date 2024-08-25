import 'package:flutter/material.dart';
import 'package:note/utility/utiltiytask.dart';
import 'package:note/model/notemodel.dart';

class TaskScene extends StatelessWidget {
   TaskScene({super.key, required this.alltask, required this.onLongPress, required this.onRemove});

  final List<NoteModel> alltask;

  Function(int) onLongPress;
  Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alltask.length,
      itemBuilder: (ctx, index) => AllTask(
        index: index,
        onLongPress: onLongPress,
        taskName: alltask[index].task,
        onRemove: (ctx) => onRemove(index),
      ),
    );
  }
}
