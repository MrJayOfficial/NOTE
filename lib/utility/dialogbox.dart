import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/model/notemodel.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key, required this.onAdd});

  final _controller = TextEditingController();
  final _controllerDescription = TextEditingController();
  Function(NoteModel) onAdd;

  void submit(context) {
    if (_controller.text.trim() == '') {
    } else {
      onAdd(NoteModel(
          task: _controller.text,
          taskDescription: _controllerDescription.text));
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.brown.shade100,
      content: Container(
        height: 400,
        // color: Colors.brown.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: _controller,
              maxLength: 50,
              decoration: const InputDecoration(
                fillColor: Colors.brown,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            TextField(
              controller: _controllerDescription,
              maxLength: 50,
              decoration: const InputDecoration(
                fillColor: Colors.brown,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    submit(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade100, elevation: 0.9),
                  child: Text(
                    "Save",
                    style: GoogleFonts.lato(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade100, elevation: 0.9),
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.lato(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
