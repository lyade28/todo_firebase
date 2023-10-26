import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/creen/add_note_screen.dart';
import 'package:todo_app/data/firestore.dart';
import 'package:todo_app/widget/stream_note.dart';
import 'package:todo_app/widget/task_widget.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});
  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  bool show = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Add_screen()));
          },
          backgroundColor: custom_green,
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            setState(() {
              show = true;
            });
          }
          if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              show = false;
            });
          }
          return true;
        },
        child: Column(
          children: [
            Stream_note(false),
            Text(
              'isDone',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold),
            ),
            Stream_note(true),
          ],
        ),
      ),
    );
  }
}
