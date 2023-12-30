import 'package:books_app/pages/settings_page.dart';
import 'package:books_app/pages/discover_page.dart';
import 'package:books_app/pages/books_page.dart';
import 'package:flutter/material.dart';
import 'package:books_app/data/bookdata.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<BookData> saved = [
    BookData(
      bookCover: 'lib/images/book_cover_1.jpg',
      bookName: 'Book 1',
      author: 'Author 1',
      pageNum: 300,
      rating: 4.5,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      genre: 'Fiction',
    ),
  ];

  List<BookData> fav = [
    BookData(
      bookCover: 'lib/images/book_cover_1.jpg',
      bookName: 'Book 1',
      author: 'Author 1',
      pageNum: 300,
      rating: 4.5,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      genre: 'Fiction',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 80, 44),
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
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

                Container(
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UserName",
                        style: TextStyle(
                          color: Color.fromARGB(255, 75, 110, 60),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1.5, // Çizgi kalınlığı
                        width: double.infinity, // Çizgi genişliği
                        color: Color.fromARGB(255, 75, 110, 60),
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

                //liste görünümü oluşturma
                //kaydedilenler için
                buildBookList("📃 Saved List", saved),

                SizedBox(height: 16),

                //favoriler için
                buildBookList("🤍 Favourites", fav),
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
          fontSize: 19.0, // Seçili olan label font büyüklüğü
          fontWeight: FontWeight.bold, // Seçili olan label font kalınlığı
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.0, // Seçili olmayan label font büyüklüğü
          fontWeight: FontWeight.w600, // Seçili olmayan label font kalınlığı
        ),

        //seçili sayfanın ikonu
        selectedIconTheme: IconThemeData(
          size: 32.0,
        ),
        unselectedIconTheme: IconThemeData(
          size: 28.0,
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

  Widget buildBookList(String title, List<BookData> bookList) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 55, 80, 44),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                return buildBookCard(bookList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBookCard(BookData book) {
    return Container(
      width: 150.0,
      margin: EdgeInsets.only(right: 12.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8.0)),
                  image: DecorationImage(
                    image: AssetImage("lib/images/book_cover.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                book.bookName,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Text(
                book.author,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
