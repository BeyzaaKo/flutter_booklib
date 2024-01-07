import 'package:books_app/book_services/service_saved.dart';
import 'package:books_app/pages/settings_page.dart';
import 'package:books_app/pages/discover_page.dart';
import 'package:books_app/pages/books_page.dart';
import 'package:flutter/material.dart';
import 'package:books_app/data/bookdata.dart';
import 'package:books_app/main.dart';
import 'package:books_app/book_services/service_fav.dart';
import 'package:books_app/book_services/service_saved.dart';
import 'dart:convert' as convert;

class ProfilePage extends StatefulWidget {
  final String? username;

  ProfilePage({this.username});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? username;

  List<BookData> fav = [];
  List<BookData> saved = [];

  @override
  void initState() {
    super.initState();
    // Kullanıcı adını direkt olarak widget parametresinden alıyoruz
    username = getIt<UserService>().username;
    getBooks();
  }

  void getBooks() async {
    try {
      var resultSaved = await FavBookServices().getFavBooks();
      var resultFav = await SavedBookServices().getSavedBooks();

      setState(() {
        saved = resultSaved;
        fav = resultFav;
      });
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  List<BookData> _parseBookJson(String jsonStr) {
    final jsonMap = convert.json.decode(jsonStr);
    final jsonList = (jsonMap['items'] as List);

    return jsonList.map((jsonBook) {
      final volumeInfo = jsonBook['volumeInfo'];
      final imageLinks = volumeInfo['imageLinks'];

      return BookData(
        bookName: volumeInfo['title'] ?? 'Unknown Title',
        author: (volumeInfo['authors'] as List<dynamic>?)?.isNotEmpty ?? false
            ? volumeInfo['authors'][0]
            : 'Unknown Author',
        pageNum: volumeInfo['pageCount'] ?? 0,
        description: volumeInfo['description'] ?? '',
        rating: volumeInfo['averageRating']?.toDouble() ?? 0.0,
        bookCover: imageLinks != null ? imageLinks['smallThumbnail'] ?? '' : '',
        genre: '',
      );
    }).toList();
  }

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPage(username: username)));
            },
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [];
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
                    radius: 60,
                    //backgroundImage: AssetImage("lib/images/avatar"),
                    backgroundImage: NetworkImage(
                        "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg"),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$username",
                        style: TextStyle(
                          color: Color.fromARGB(255, 75, 110, 60),
                          fontSize: 21,
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
                buildBookList("Saved List", saved),

                SizedBox(height: 16),

                //favoriler için
                buildBookList("Favourites", fav),
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
    IconData titleIcon = title == "Saved List" ? Icons.list : Icons.favorite;

    return Container(
      margin: EdgeInsets.only(top: 10, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                titleIcon, // İkonu buradan alın
                color: Color.fromARGB(255, 55, 80, 44),
                size: 28,
              ),
              SizedBox(width: 8), // İkon ile metin arasında boşluk
              Text(
                title,
                style: TextStyle(
                  color: Color.fromARGB(255, 55, 80, 44),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 180.0,
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
      width: 120.0,
      margin: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        //color: const Color.fromARGB(255, 216, 216, 216),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Card(
        color: Color.fromARGB(150, 193, 204, 188),
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
                    image: NetworkImage(book.bookCover),
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
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Text(
                book.author,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
