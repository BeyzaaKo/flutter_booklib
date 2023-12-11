import 'package:books_app/books/newbooks.dart';
import 'package:books_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:books_app/books/popularbooks.dart';
import 'package:books_app/data/bookdata.dart';
import 'package:http/http.dart' as http;
import 'package:books_app/book_services/service3.dart';
import 'dart:convert' as convert;

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<BookData> searchedBooks = [];
  List<BookData> popularBooks = [];

  @override
  void initState() {
    super.initState();
    getPopularBooks();
  }

  // Arama yapma metodu
  void searchBooks(String query) async {
    final apiKey = 'AIzaSyCyzDggZ-_ChpGRDcY9UQPh44tkIzOFyQU';
    final apiUrl =
        'https://www.googleapis.com/books/v1/volumes?q=$query&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        searchedBooks = _parseBookJson(response.body);
      });
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }

  // Popüler kitapları çekme metodu
  void getPopularBooks() async {
    try {
      var result = await PopularBookServices().getPopularBooks();
      if (result.isNotEmpty) {
        setState(() {
          popularBooks = result;
          print('Popular Books: $popularBooks'); // Bu satırı ekledik
        });
      } else {
        print('No popular books found');
      }
    } catch (e) {
      print('Error fetching popular books: $e');
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
          "Discover",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (query) {
                  searchBooks(query);
                },
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
                "See what's new...",
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 110, 60),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12),

              //liste görünümü oluşturma
              // Popüler kitapları gösteren widget
              Container(
                width: double.infinity,
                height: 300.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: popularBooks.map((book) => popBook(book)).toList(),
                ),
              ),

              SizedBox(height: 20),

              Text(
                "Search Results:",
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 110, 60),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 12,
              ),

              // Arama sonuçlarını gösteren widget
              Container(
                width: double.infinity,
                height: 1000,
                child: ListView(
                  children: searchedBooks.map((book) => newBook(book)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
