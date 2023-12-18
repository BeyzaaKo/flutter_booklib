import 'package:flutter/material.dart';
import 'package:books_app/components/my_textfield.dart';
import 'package:books_app/components/my_signbutton.dart';

class SignupPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 153, 196, 133),

      //geri dönme butonu
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white, // İkon rengini belirleyebilirsiniz
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: true, // Geri dönme ikonunu otomatik ekle
        backgroundColor: Colors.transparent, // App bar arkaplan rengi
        elevation: 0, // App bar gölge efekti
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 25),
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            SizedBox(height: 15),
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            SizedBox(height: 15),
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: false,
            ),
            SizedBox(height: 30),

            //sign up button
            MySignButton(
              onTap: signUserUp,
            ),
          ],
        ),
      ),
    );
  }
}
