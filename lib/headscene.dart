import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:note/model/notemodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/utility/utiltiytask.dart';
import 'package:note/utility/dialogbox.dart';
import 'package:note/page/homepage.dart';
import 'package:note/page/descriptionpage.dart';
import 'package:note/database/notedatabase.dart';
import 'package:hive/hive.dart';

class StartingScene extends StatefulWidget {
  const StartingScene({super.key});

  @override
  State<StartingScene> createState() {
    return StartingScenestate();
  }
}

class StartingScenestate extends State<StartingScene> {
  var startScene = 'home-page';

  final box = Hive.box('notebox');

  var indexDescription = 0;

  @override
  void initState() {
    if (box.length != 0) {
      db.getData();
    }
    super.initState();
  }

  final db = DataBase();
  void onAdd(NoteModel note) {
    setState(() {
      db.update();
      db.alltask.add(note);
    });
  }

  void onRemove(int index) {
    setState(() {

      db.alltask.removeAt(index);
    });
  }

  void backToHome() {
    setState(() {
      startScene = 'home-page';
    });
  }

  void onPressed() {
    showDialog(
        context: context,
        builder: (ctx) => DialogBox(
              onAdd: onAdd,
            ));
  }

  void longPress(int index) {
    setState(() {
      indexDescription = index;
      startScene = 'description-page';
    });
  }

  
  @override
  Widget build(BuildContext context) {
    Widget? floatingButton;
    Widget currentScene = TaskScene(
        alltask: db.alltask, onLongPress: longPress, onRemove: onRemove);

    if (startScene == 'description-page') {
      floatingButton = ElevatedButton(
        onPressed: backToHome,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: Colors.brown.shade800,
            elevation: 1),
        child: const Text(
          "Back",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      );
      currentScene = DescriptionPage(
          desciption: db.alltask[indexDescription].taskDescription);
    } else if (startScene == 'home-page') {
      floatingButton = FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: Colors.brown[300],
          child: const Icon(Icons.add));
      currentScene = TaskScene(
          alltask: db.alltask, onLongPress: longPress, onRemove: onRemove);
    }

    return Scaffold(
        backgroundColor: Colors.brown.shade400,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.brown,
          title: Text(
            "NOTE",
            style: GoogleFonts.oswald(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        floatingActionButton: floatingButton,
        body: currentScene);
  }
}
