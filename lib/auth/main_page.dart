import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth/auth_page.dart';
import 'package:todo_app/creen/home.dart';

class Main_page extends StatefulWidget {
  const Main_page({super.key});

  @override
  State<Main_page> createState() => _Main_pageState();
}

class _Main_pageState extends State<Main_page> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges() , builder: (context,snapshot){
if(snapshot.hasData) {
  return const Home_screen();
} else{
  return const Auth_Page();
}
      } , ),
    );
  }
}