
import 'package:flutter/material.dart';
import 'package:todo_app/creen/login.dart';
import 'package:todo_app/creen/sign_up.dart';

class Auth_Page extends StatefulWidget {
  const Auth_Page({super.key});

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

class _Auth_PageState extends State<Auth_Page> {
  bool a = true ; 
  void to() {
    setState(() {
      a=!a ; 
    });
  }
  @override
  Widget build(BuildContext context) {
    if(a) {
      return Login_Screen(to);

    }else{
      return Sign_up_screen(to) ; 
    }
  }
}