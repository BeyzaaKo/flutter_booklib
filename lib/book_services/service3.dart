//popüler kitapların verilerini api üzerinden çekmek için

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:books_app/data/bookdata.dart';

class PopularBookServices {
  Future<List<BookData>> getPopularBooks() async {
    List<BookData> allBooks = [];
    try {
      print('API Started');

      List<String> genres = [
        'fiction',
        'classic',
        'romance',
        'mystery',
        'fantasy',
        'history',
        'comic',
        'crime'
      ];

      for (String subject in genres) {
        var url =
            'https://www.googleapis.com/books/v1/volumes?q=subject:$subject&orderBy=newest&maxResults=5';
        var response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          List<BookData> books = _parseBookJson(response.body);
          allBooks.addAll(books);
        } else {
          print(
              'Error fetching popular books for $subject: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      }

      return allBooks;
    } catch (e) {
      print('Error fetching popular books: $e');
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
