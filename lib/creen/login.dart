

import 'package:flutter/material.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/data/auth_data.dart';

class Login_Screen extends StatefulWidget {
  final VoidCallback show;
  const Login_Screen(this.show,{super.key} );
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {
        
      });
     });
     _focusNode2.addListener(() { 
      setState(() {
        
      });
     });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            image(),
            const SizedBox(
              height: 50,
            ),
            texfield(email, _focusNode1, 'Email', Icons.email),
            const SizedBox(
              height: 10,
            ),
            texfield(password, _focusNode2, 'Password', Icons.password),
            const SizedBox(
              height: 15,
            ),
            Account(),
            const SizedBox(
              height: 20,
            ),
            Login_button()
          ],
        ),
      )),
    );
  }

  Widget Account() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "J'ai pas compte? ",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                const SizedBox(width: 5,),
                GestureDetector(
                  onTap: widget.show,
                  child: Text(
                    "S'inscrir",
                    style: TextStyle(color: custom_green, fontSize: 14 ,  fontWeight: FontWeight.bold) ,
                  ),
                ),
              ],
            ),
          );
  }

  Widget Login_button() {
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
            AuthenticationRemomote().login(email.text, password.text);
          },
          child: const Text(
            'Connexion',
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

  Widget texfield(TextEditingController controller, FocusNode focusNode,
      String typeName, IconData icons) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icons,
              color: focusNode.hasFocus
                  ? custom_green
                  : const Color(
                      0xffc5c5c5,
                    ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: typeName,
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

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/7.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
