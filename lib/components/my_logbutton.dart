import 'package:books_app/navigationBar/nav_bar.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 130),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 55, 80, 44),
        borderRadius: BorderRadius.circular(50),
      ),
      child: MaterialButton(
        onPressed: (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NavBar(
                        initialPage: 2,
                      )));
        }),
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
