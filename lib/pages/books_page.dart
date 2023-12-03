import 'package:books_app/components/book_genres/action.dart';
import 'package:books_app/components/book_genres/classics.dart';
import 'package:books_app/components/book_genres/dystophian.dart';
import 'package:books_app/components/book_genres/fantasy.dart';
import 'package:books_app/components/book_genres/romance.dart';
import 'package:books_app/components/mysaveds.dart';
import 'package:flutter/material.dart';
import 'package:books_app/components/settings_page.dart';
import 'package:books_app/data/bookdata.dart';
import 'package:books_app/pages/books_page.dart';
import 'package:books_app/pages/discover_page.dart';
import 'package:books_app/pages/profile_page.dart';

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
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
          "Books",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            //geri dönme butonu
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white, //Color.fromARGB(255, 4, 157, 184),
                size: 24,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              }),
        ],
      ),

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // Burada profil bilgileri veya başka öğeler olabilir
            // SliverAppBar veya SliverPersistentHeader gibi
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Genres",
                        style: TextStyle(
                          color: Color.fromARGB(255, 75, 110, 60),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1.5, // Çizgi kalınlığı
                        width: double.infinity, // Çizgi genişliği
                        color: Color.fromARGB(255, 75, 110, 60),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                //liste görünümü oluşturma
                //aksiyon için
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Action and Adventure",
                        style: TextStyle(
                          color: Color.fromARGB(255, 55, 80, 44),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Altından boşluk

                Container(
                  width: double.infinity,
                  height: 170.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      action(books[0]),
                      action(books[1]),
                      action(books[2]),
                      action(books[3]),
                    ],
                  ),
                ),

                //fantastik için
                Container(
                  margin: EdgeInsets.only(top: 0, left: 15, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fantasy",
                        style: TextStyle(
                          color: Color.fromARGB(255, 55, 80, 44),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  height: 170.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      fantasy(books[3]),
                      fantasy(books[1]),
                      fantasy(books[2]),
                      fantasy(books[0]),
                    ],
                  ),
                ),

                //distopik için
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dystophian",
                        style: TextStyle(
                          color: Color.fromARGB(255, 55, 80, 44),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Altından boşluk

                Container(
                  width: double.infinity,
                  height: 170.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      dystophian(books[0]),
                      dystophian(books[3]),
                      dystophian(books[2]),
                      dystophian(books[1]),
                    ],
                  ),
                ),

                //romantik için
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Romance",
                        style: TextStyle(
                          color: Color.fromARGB(255, 55, 80, 44),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Altından boşluk

                Container(
                  width: double.infinity,
                  height: 170.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      romance(books[1]),
                      romance(books[2]),
                      romance(books[3]),
                      romance(books[3]),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                //klasikler için
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Classics",
                        style: TextStyle(
                          color: Color.fromARGB(255, 55, 80, 44),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Altından boşluk

                Container(
                  width: double.infinity,
                  height: 170.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      classics(books[0]),
                      classics(books[2]),
                      classics(books[3]),
                      classics(books[3]),
                    ],
                  ),
                ),

                SizedBox(height: 10),
              ],
            ),
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
        currentIndex: 0,

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
