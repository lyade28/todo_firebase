import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/creen/add_note_screen.dart';
import 'package:todo_app/widget/stream_note.dart';

import '../data/auth_data.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});
  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Logout(),
            ),
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

Widget Logout() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: custom_green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemomote().signOut();
        },
        child: const Text(
          'Deconnexion',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
