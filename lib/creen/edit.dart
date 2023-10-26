import 'package:flutter/material.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/data/firestore.dart';
import 'package:todo_app/model/note_model.dart';

class Edit_screen extends StatefulWidget {
  Note _note ;
   Edit_screen(this._note, {super.key});

  @override
  State<Edit_screen> createState() => _Edit_screenState();
}

class _Edit_screenState extends State<Edit_screen> {
 TextEditingController? title;
 TextEditingController? subtitle;


  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  int indexx = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = TextEditingController(text : widget._note.title);
    subtitle = TextEditingController(text : widget._note.subtitle);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title_widget(),
          const SizedBox(
            height: 20,
          ),
          subtitle_widget(),
          SizedBox(
            height: 20,
          ),
          imagess(),
          SizedBox(
            height: 20,
          ),
          button()
        ],
      )),
    );
  }

  Widget button() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: custom_green,
                minimumSize: Size(170, 48)
              ),
              onPressed: () {
                Firestore_Datasource().Update_note(widget._note.id, indexx, title!.text, subtitle!.text);
Navigator.pop(context);
             }, child: Text('ajouter tache'),),
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                minimumSize: Size(170, 48)
              ),
              onPressed: () {

Navigator.pop(context);
             }, child: Text('Annuler'),),
          ],
        );
  }

  Widget imagess() {
    return Container(
      height: 180,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  indexx = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: indexx == index ? custom_green : Colors.grey,
                    )),
                width: 140,
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [Image.asset('images/${index}.png')],
                ),
              ),
            );
          }),
    );
  }

  Widget title_widget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: title,
          focusNode: _focusNode1,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Titre',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget subtitle_widget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: 3,
          controller: subtitle,
          focusNode: _focusNode2,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Subtitle',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
