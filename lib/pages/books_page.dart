/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:books_app/book_genres/action.dart';
import 'package:books_app/book_genres/classics.dart';
import 'package:books_app/book_genres/dystophian.dart';
import 'package:books_app/book_genres/fantasy.dart';
import 'package:books_app/book_genres/romance.dart';
import 'package:books_app/pages/settings_page.dart';
import 'package:books_app/data/bookdata.dart';
import 'package:books_app/pages/books_page.dart';
import 'package:books_app/pages/discover_page.dart';
import 'package:books_app/pages/profile_page.dart';

class BooksPage extends StatefulWidget {
  final String genre;

  BooksPage({required this.genre});

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  List<BookData> _parseBookJson(String jsonStr, String genre) {
    final jsonMap = json.decode(jsonStr);
    final jsonList =
        (jsonMap['items'] as List); // 'items' altındaki verileri al
    return jsonList
        .map<BookData>((jsonBook) => BookData.fromJson(
              jsonBook,
              genre,
            ))
        .toList();
  }

  List<BookData> actionBooks = [];
  List<BookData> fantasyBooks = [];
  List<BookData> dystophianBooks = [];
  List<BookData> romanceBooks = [];
  List<BookData> classicsBooks = [];

  @override
  void initState() {
    super.initState();
    // Veriyi çekmek için initState içinde fetchData fonksiyonunu çağırın
    fetchBooksForGenres(
        ['aksiyon', 'fantastik', 'distopik', 'romantik', 'klasik']);
  }

  Future<void> fetchBooksForGenres(List<String> genres) async {
    for (var genre in genres) {
      await fetchDataForGenre(genre);
    }
  }

  Future<void> fetchDataForGenre(String genre) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=subject:$genre&key=API_KEY',
        ),
      );

      if (response.statusCode == 200) {
        // Eğer sunucu başarılı bir 200 OK cevabı dönerse, JSON'u işleyin
        final List<BookData> fetchedBooks =
            _parseBookJson(response.body, genre);

        // State'i güncelleyin ve yeni veriyle birlikte yeniden oluşturun
        setState(() {
          if (genre == 'aksiyon') {
            actionBooks = fetchedBooks;
          } else if (genre == 'fantastik') {
            fantasyBooks = fetchedBooks;
          } else if (genre == 'distopik') {
            dystophianBooks = fetchedBooks;
          } else if (genre == 'romantik') {
            romanceBooks = fetchedBooks;
          } else if (genre == 'klasik') {
            classicsBooks = fetchedBooks;
          }
        });
      } else {
        // Eğer sunucu başarılı bir 200 OK cevabı dönmese
        // bir hata oluşturun.
        print(
            'Books for genre $genre failed to load. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching books for genre $genre: $error');
    }
  }

  Widget _buildGenreList(String genre, List<BookData> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          genre,
          style: TextStyle(
            color: Color.fromARGB(255, 55, 80, 44),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 170.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: books.map((book) => _buildBookCard(book)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBookCard(BookData book) {
    if (book.genre == 'aksiyon') {
      return action(book);
    } else if (book.genre == 'fantastik') {
      return fantasy(book);
    } else if (book.genre == 'distopik') {
      return dystophian(book);
    } else if (book.genre == 'romantik') {
      return romance(book);
    } else if (book.genre == 'klasik') {
      return classics(book);
    }
    return Container(); // Fallback
  }

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

      body: Padding(
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
            _buildGenreList(widget.genre, _getBooksByGenre(widget.genre)),
            SizedBox(height: 10),
          ],
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
                MaterialPageRoute(builder: (context) => BooksPage(genre: '')),
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

  List<BookData> _getBooksByGenre(String genre) {
    switch (genre) {
      case 'aksiyon':
        return actionBooks;
      case 'fantastik':
        return fantasyBooks;
      case 'distopik':
        return dystophianBooks;
      case 'romantik':
        return romanceBooks;
      case 'klasik':
        return classicsBooks;
      default:
        return [];
    }
  }
}
*/

import 'package:books_app/pages/settings_page.dart';
import 'package:books_app/genres/books_list.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({Key? key}) : super(key: key);

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
            fontSize: 24,
            fontWeight: FontWeight.bold,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

        //kategoriler iki sütunlu bir ızgara şeklinde görüntülenir
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categoriesName.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 16 / 15,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            //her kategori ismi yazıldığında belli bir işlem yapar, BookList sayfasına geçer
            return GestureDetector(
              onTap: () {
                print(categoriesName[index]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookList(name: categoriesName[index])));
              },

              //gradient ekler
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(categoriesImage[index]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3)
                          ],
                          stops: const [0.6, 0.9],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      categoriesName[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

List categoriesName = [
  //science, children, romance, fantasy, graphic novel, horror, historical, art, food, travel, parenting, crime,Contemporary fiction
  "Children's Fiction",
  "Fantasy",
  "Romance",
  "Historical",
  "Graphic novel",
  "Science",
  "Crime",
  "Horror",
  "Art",
  "Food",
  "Travel",
  "Parenting",
  "Contemporary Fiction"
];

List categoriesImage = [
  "https://img.freepik.com/premium-photo/child-reading-book-book-called-sun_579873-10527.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/ancient-castle-mountains-generative-ai_169016-30429.jpg?w=900&t=st=1702247345~exp=1702247945~hmac=d9ef419d25cdbeabea02139aaf2feaa08d121a98277446a62642600103e403ce",
  "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cm9tYW5jZSUyMGJvb2tzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://img.freepik.com/free-photo/vintage-marine-still-life-close-up_93675-128587.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=sph",
  "https://cdn.marvel.com/content/1x/xmenhellfire2023001_int_jpeg.jpg",
  "https://img.freepik.com/premium-photo/reading-various-literature-books-concept-science-literature_185193-116782.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://images.unsplash.com/photo-1625449281218-cbb6183f0aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y3JpbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://img.freepik.com/free-photo/darkness-night-with-skull-high-view_23-2148277555.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/view-vintage-paint-brushes-easel_23-2150315229.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/top-view-recipe-book-still-life-concept_23-2149055994.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/wing-airplane-with-city-background_1232-1308.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/family-reading-sofa_23-2147997511.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/open-book-with-fairytale-scene_52683-107846.jpg?w=900&t=st=1702247098~exp=1702247698~hmac=06fd4725c028effdd587bb356ed8a83bf171a11523115a098f24380e5a88af66",
];
