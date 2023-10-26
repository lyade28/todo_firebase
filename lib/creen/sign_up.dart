
import 'package:flutter/material.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/data/auth_data.dart';

class Sign_up_screen extends StatefulWidget {
  final VoidCallback show;
  const Sign_up_screen(this.show, { super.key});
  @override
  State<Sign_up_screen> createState() => _Sign_up_screenState();
}

class _Sign_up_screenState extends State<Sign_up_screen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();

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
     _focusNode3.addListener(() { 
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
              height: 10,
            ),
            texfield(passwordConfirm, _focusNode3, 'PasswordConfirm', Icons.password),
            const SizedBox(
              height: 15,
            ),
            Account(),
            const SizedBox(
              height: 20,
            ),
           Sign_up_button()
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
                  "Vous avez un compte ? ",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                const SizedBox(width: 5,),
                GestureDetector(
                  onTap: widget.show,
                  child: Text(
                    "Se connecter",
                    style: TextStyle(color: custom_green, fontSize: 14 ,  fontWeight: FontWeight.bold) ,
                  ),
                ),
              ],
            ),
          );
  }

  Widget Sign_up_button() {
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
            AuthenticationRemomote().register(email.text, password.text, passwordConfirm.text);
          },
          child: const Text(
            "S'inscrire",
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
