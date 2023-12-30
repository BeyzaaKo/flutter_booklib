import 'package:books_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:books_app/pages/sinup_page.dart';
import 'package:books_app/jsonModel/users.dart';
import 'package:books_app/SQLite/sqlite.dart';
import 'package:get_it/get_it.dart';
import 'package:books_app/main.dart';

final getIt = GetIt.instance;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  //A bool variable for show and hide password
  bool isVisible = false;
  bool isLoginTrue = false;

  final db = DatabaseHelper();

  final formKey = GlobalKey<FormState>();

  void signUserIn() async {
    if (formKey.currentState!.validate()) {
      var response = await db.login(Users(
        usrName: usernameController.text,
        usrPassword: passwordController.text,
        usrEmail: emailController.text,
      ));
      if (response == true) {
        // Kullanıcı adını güncelle
        getIt<UserService>().username = usernameController.text;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(
              username: usernameController.text,
            ),
          ),
        );
      } else {
        setState(() {
          isLoginTrue = true;
        });
      }
    }
  }

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

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(children: [
                // Username field
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "Username",
                    ),
                  ),
                ),

                // Password field
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      border: InputBorder.none,
                      hintText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Login button
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 90, 126, 73),
                  ),
                  child: TextButton(
                    onPressed: signUserIn,
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                // Sign up button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a member?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Color.fromARGB(255, 35, 53, 28),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25),

                // Error message
                isLoginTrue
                    ? const Text(
                        "Username or password is incorrect",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const SizedBox(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
