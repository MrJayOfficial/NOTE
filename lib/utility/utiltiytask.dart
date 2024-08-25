import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AllTask extends StatelessWidget {
  AllTask(
      {super.key,
      required this.taskName,
      required this.onRemove,
      required this.onLongPress,required this.index});
  Function(int) onLongPress;
  final String taskName;
  final int index;
  Function(BuildContext) onRemove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            backgroundColor: Colors.black,
            borderRadius: BorderRadius.circular(20),
            onPressed: onRemove,
            icon: Icons.delete,
          )
        ]),
        child: GestureDetector(
          onLongPress: () {
            onLongPress(index);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.brown.shade500),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  taskName,
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
