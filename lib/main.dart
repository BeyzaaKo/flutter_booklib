import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 153, 196, 133),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              'lib/images/book_lib.png',
              width: 200,
              height: 200,
            ),

            const SizedBox(height: 10),

            //Name
            Text(
              'BookLib❤️',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            //login butonu
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(22.0), // Butonun köşe yuvarlaklığı
                ),
                primary: Color.fromARGB(255, 55, 80, 44), // Buton rengi
                onPrimary: Colors.white, // Buton metin rengi
                minimumSize: Size(150, 50),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),

            //sign up butonu
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(22.0), // Butonun köşe yuvarlaklığı
                ),
                primary: Color.fromARGB(255, 55, 80, 44), // Buton rengi
                onPrimary: Colors.white, // Buton metin rengi
                minimumSize:
                    Size(150, 50), // Minimum boyut (genişlik, yükseklik)
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
