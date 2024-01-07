import 'package:books_app/genres/app_notifier.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/sinup_page.dart';
import 'package:provider/provider.dart';
//import 'components/user_provider.dart';
//import 'package:books_app/genres/app_notifier.dart';
import 'package:get_it/get_it.dart';

// GetIt servisini oluşturun
final getIt = GetIt.instance;

// Kullanıcı adını saklamak için bir servis sınıfı
class UserService {
  String? _username;

  String? get username => _username;

  set username(String? value) {
    _username = value;
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppNotifier()),
        // Diğer provider'ları da ekleyebilirsiniz
      ],
      child: const MyApp(),
    ),
    /*
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppNotifier()),
        // Diğer providerlar buraya eklenebilir
      ],
      child: const MyApp(),
    ),*/
  );
  // GetIt servisini başlatın
  getIt.registerLazySingleton(() => UserService());
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
              width: 250,
              height: 250,
            ),

            const SizedBox(height: 10),

            //Name
            const Text(
              'BookLib❤️',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
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
                      BorderRadius.circular(18), // Butonun köşe yuvarlaklığı
                ),
                primary: Color.fromARGB(255, 55, 80, 44), // Buton rengi
                onPrimary: Colors.white, // Buton metin rengi
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.6, //genişlik
                  55, //yükseklik
                ),
              ),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
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
                      BorderRadius.circular(18), // Butonun köşe yuvarlaklığı
                ),
                primary: const Color.fromARGB(255, 55, 80, 44), // Buton rengi
                onPrimary: Colors.white, // Buton metin rengi
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.6, //genişlik
                  55, //yükseklik
                ), // Minimum boyut (genişlik, yükseklik)
              ),
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
