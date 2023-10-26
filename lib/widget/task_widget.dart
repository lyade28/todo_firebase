import 'package:flutter/material.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/creen/edit.dart';
import 'package:todo_app/data/firestore.dart';
import 'package:todo_app/model/note_model.dart';

class Task extends StatefulWidget {
  Note _note ;
   Task(this._note, {super.key});

  @override
  State<Task> createState() => _TaskState();
}


class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    bool isDon =  widget._note.isDon;
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Container(
            padding: const EdgeInsets.all(4),
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2)),
              ],
            ),
            child: Row(
              children: [
                //images
                imageee(),
                const SizedBox(
                  width: 25,
                ),
                //titre et sous titre
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          widget._note.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                          activeColor: custom_green,
                            value: isDon,
                            onChanged: (value) {
                              setState(() {
                                isDon = !isDon;
                              });
                              Firestore_Datasource().isdone(widget._note.id, isDon);
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                       widget._note.subtitle,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400),
                    ),
                    const Spacer(),
                    Edit_time()
                  ],
                ))
              ],
            ),
          ),
        );
   
  }

  Widget Edit_time() {
    return Padding(
                    padding:   EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 28,
                          decoration: BoxDecoration(
                            color: custom_green,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child:  Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: Row(
                              children: [
                                Image(
                                    image:
                                        AssetImage('images/icon_time.png')),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                              widget._note.time,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Edit_screen(widget._note)));
                          }, 
                          child: Container(
                            width: 90,
                            height: 28,
                            decoration: BoxDecoration(
                              color: const Color(0xffE2F6F1),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              child: Row(
                                children: [
                                  Image(
                                      image:
                                          AssetImage('images/icon_edit.png')),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
  }

  Widget imageee() {
    return Container(
      height: 130,
      width: 100,
      decoration:  BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('images/${widget._note.image}.png'),
            fit: BoxFit.cover,
          )),
    );
  }
}
