import 'package:books_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class MySignButton extends StatelessWidget {
  final Function()? onTap;

  const MySignButton({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 130),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 55, 80, 44),
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }),
        child: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
