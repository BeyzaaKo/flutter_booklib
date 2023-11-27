import 'package:books_app/pages/books_page.dart';
import 'package:books_app/pages/discover_page.dart';
import 'package:books_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:books_app/components/mysaveds.dart';
import 'package:books_app/components/myfavs.dart';
import 'package:books_app/data/bookdata.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<BookData> saved = [
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

  List<BookData> fav = [
    BookData("https://m.media-amazon.com/images/I/713QrA632AL._SY522_.jpg",
        "The Vanishing Hal", "Britt Bennett", 400, 4.4, "bookDescription"),
    BookData("https://m.media-amazon.com/images/I/718W0JbHm1L._SL1500_.jpg",
        "Normal People", "Sally Rooney", 304, 4.1, "bookDescription"),
    BookData(
        "https://m.media-amazon.com/images/I/61k7JqSWOUL._SY522_.jpg",
        "The Ballad of Songbirds and Snakes",
        "Suzanne Collins",
        528,
        4.6,
        "bookDescription"),
    BookData("https://m.media-amazon.com/images/I/81msb6gUBTL._SY522_.jpg",
        "The Song of Achilles", "Madeline Miller", 416, 4.6, "bookDescription"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 157, 184),
        centerTitle: true,
        title: Text(
          "Profile",
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
            color: Colors.white, //Color.fromARGB(255, 4, 157, 184),
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
              // Ayarlar sayfasına gitme işlemleri buraya eklenir
            },
          ),
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
                SizedBox(height: 20), // Üstten boşluk
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("lib/images/avatar.png"),
                  ),
                ),
                //Padding(
                //padding: const EdgeInsets.only(left: 20, top: 0),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UserName",
                        style: TextStyle(
                          color: Color.fromARGB(255, 4, 157, 184),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1.5, // Çizgi kalınlığı
                        width: double.infinity, // Çizgi genişliği
                        color: Color.fromARGB(255, 4, 157, 184),
                      ),
                      /* //FOLLOWLAMA İŞLEMİ AMA YAPMAK İSTEDİĞİMDEN EMİN DEĞİLİM
                      ElevatedButton(
                        onPressed: () {
                          // Follow butonuna tıklandığında yapılacak işlemler buraya eklenir.
                        },
                        child: Text("Follow"),
                      ),*/
                    ],
                  ),
                ),
                SizedBox(height: 15),

                Container(
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "📃 Saved List",
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 128, 151),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12), // Altından boşluk

                //liste görünümü oluşturma
                //kaydedilenler için
                Container(
                  width: double.infinity,
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      mySaved(saved[0]),
                      mySaved(saved[1]),
                      mySaved(saved[2]),
                      mySaved(saved[3]),
                      mySaved(saved[3]),
                    ],
                  ),
                ),

                SizedBox(height: 16), // Altından boşluk

                Container(
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "🤍 Favourites",
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 128, 151),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),

                //favoriler için
                Container(
                  width: double.infinity,
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      myFavs(fav[0]),
                      myFavs(fav[1]),
                      myFavs(fav[2]),
                      myFavs(fav[3]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      //navigation bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        //seçili sayfanın rengi
        selectedItemColor: Color.fromARGB(127, 5, 134, 157),
        unselectedItemColor: Color.fromARGB(255, 4, 157, 184),

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
        currentIndex: 2,

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
