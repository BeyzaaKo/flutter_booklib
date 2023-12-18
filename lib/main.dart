import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/sinup_page.dart';
import 'package:books_app/genres/app_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppNotifier()),
        // Diğer providerlar buraya eklenebilir
      ],
      child: const MyApp(),
    ),
  );
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
      backgroundColor: const Color.fromARGB(255, 153, 196, 133),
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
            const Text(
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
              child: const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),

            //sign up butonu
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(22.0), // Butonun köşe yuvarlaklığı
                ),
                primary: const Color.fromARGB(255, 55, 80, 44), // Buton rengi
                onPrimary: Colors.white, // Buton metin rengi
                minimumSize:
                    const Size(150, 50), // Minimum boyut (genişlik, yükseklik)
              ),
              child: const Text(
                'Sign Up',
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
