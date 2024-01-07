/*import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:books_app/data/bookdata.dart';

class FavBookServices {
  final String apiUrl; // API'nin URL'si

  FavBookServices(this.apiUrl);

  Future<List<BookData>> getFavBooks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return _parseBookJson(response.body);
    } else {
      throw Exception('Failed to load books');
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
}*/

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:books_app/data/bookdata.dart';

class FavBookServices {
  Future<List<BookData>> getFavBooks() async {
    List<BookData> allBooks = [];
    try {
      print('API Started');

      List<String> genres = [
        'mystery',
        'fantasy',
        'classic',
        'romance',
        'history',
        'comic',
        'fiction',
        'crime'
      ];

      for (String subject in genres) {
        var url =
            'https://www.googleapis.com/books/v1/volumes?q=subject:$subject&orderBy=newest&maxResults=2';
        var response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          List<BookData> books = _parseBookJson(response.body);
          allBooks.addAll(books);
        } else {
          print(
              'Error fetching fav books for $subject: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      }

      return allBooks;
    } catch (e) {
      print('Error fetching fav books: $e');
      return [];
    }
  }
}

List<BookData> _parseBookJson(String jsonStr) {
  try {
    final jsonMap = convert.json.decode(jsonStr);
    final jsonList = (jsonMap['items'] as List);

    return jsonList.map((jsonBook) {
      final volumeInfo = jsonBook['volumeInfo'];
      final imageLinks = volumeInfo?['imageLinks'] ?? {};

      return BookData(
        bookCover: imageLinks['thumbnail'] ?? 'No Image',
        bookName: volumeInfo['title'] ?? 'Unknown Title',
        author: (volumeInfo['authors'] as List<dynamic>?)?.isNotEmpty ?? false
            ? volumeInfo['authors'][0]
            : 'Unknown Author',
        pageNum: volumeInfo['pageCount'] ?? 0,
        rating: volumeInfo['averageRating']?.toDouble() ?? 0.0,
        description: volumeInfo['description'] ?? '',
        genre: '',
      );
    }).toList();
  } catch (e) {
    print('Error parsing JSON: $e');
    return [];
  }
}
