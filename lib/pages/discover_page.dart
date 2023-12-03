import 'package:books_app/components/newbooks.dart';
import 'package:books_app/components/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:books_app/components/popularbooks.dart';
import 'package:books_app/data/bookdata.dart';
import 'package:books_app/components/newbooks.dart';
import 'package:books_app/pages/books_page.dart';
import 'package:books_app/pages/discover_page.dart';
import 'package:books_app/pages/profile_page.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<BookData> books = [
    BookData(
        "https://m.media-amazon.com/images/I/81+Qh6wGRKL._AC_UF1000,1000_QL80_.jpg",
        "A Place Called Perfect",
        "Helena Duggan",
        132,
        3.8,
        "bookDescription"),
    BookData("https://m.media-amazon.com/images/I/718W0JbHm1L._SL1500_.jpg",
        "Normal People", "Sally Rooney", 304, 4.1, "bookDescription"),
    BookData(
        "https://m.media-amazon.com/images/I/61k7JqSWOUL._SY522_.jpg",
        "The Ballad of Songbirds and Snakes",
        "Suzanne Collins",
        528,
        4.6,
        "bookDescription"),
    BookData(
        "https://m.media-amazon.com/images/I/417CJF0ASyL._SY445_SX342_.jpg",
        "Mr Salary",
        "Sally Rooney",
        48,
        4.4,
        "bookDescription"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 80, 44),
        centerTitle: true,
        title: Text(
          "Discover",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 237, 237, 237),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.all(8.0),
                  hintText: "Search book name or author",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Popular Books",
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 110, 60),
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12),

              //liste görünümü oluşturma
              Container(
                width: double.infinity,
                height: 260.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    popBook(books[0]),
                    popBook(books[1]),
                    popBook(books[2]),
                    popBook(books[3]),
                    popBook(books[0]),
                    popBook(books[1]),
                    popBook(books[2]),
                    popBook(books[3]),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Text(
                "See Also",
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 110, 60),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 12,
              ),

              Container(
                width: double.infinity,
                height: 600.0,
                child: ListView(
                  children: [
                    newBook(books[0]),
                    newBook(books[3]),
                    newBook(books[1]),
                    newBook(books[2]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //navigation bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        //seçili sayfanın rengi
        selectedItemColor: Color.fromARGB(255, 121, 159, 103),
        unselectedItemColor: Color.fromARGB(255, 55, 80, 44),

        //seçili sayfanın fontu
        selectedLabelStyle: TextStyle(
          fontSize: 14.0, // Seçili olan label font büyüklüğü
          fontWeight: FontWeight.bold, // Seçili olan label font kalınlığı
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.0, // Seçili olmayan label font büyüklüğü
          fontWeight: FontWeight.normal, // Seçili olmayan label font kalınlığı
        ),

        //seçili sayfanın indeksi
        currentIndex: 1,

        //seçili sayfaya gitmek için
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BooksPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiscoverPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            label: "Books",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
