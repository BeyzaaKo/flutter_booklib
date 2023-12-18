//tüm kitap verilerini Google Books API üzerinden çekmek içinimport 'dart:async';

import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:books_app/data/bookdata.dart';

class BookServices {
  String genreType = Get.arguments;

  Future<List<BookData>> getAllBooks() async {
    try {
      print('API Started');

      var url = Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=subject:$genreType');
      var response = await http.get(url).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return _parseBookJson(response.body);
      } else {
        print('API returned status code: ${response.statusCode}');
        return [];
      }
    } on TimeoutException catch (_) {
      print('Response Timeout');
      return [];
    } catch (e) {
      print('Unexpected error: $e');
      return [];
    }
  }

  List<BookData> _parseBookJson(String jsonStr) {
    final jsonMap = convert.json.decode(jsonStr);
    final jsonList = (jsonMap['items'] as List);

    return jsonList
        .map((jsonBook) => BookData(
              bookCover: jsonBook['volumeInfo']['imageLinks']['thumbnail'],
              bookName: jsonBook['volumeInfo']['title'] ?? 'Unknown Title',
              author: (jsonBook['volumeInfo']['authors'] as List<dynamic>?)
                          ?.isNotEmpty ??
                      false
                  ? jsonBook['volumeInfo']['authors'][0]
                  : 'Unknown Author',
              pageNum: jsonBook['volumeInfo']['pageCount'] ?? 0,
              rating:
                  jsonBook['volumeInfo']['averageRating']?.toDouble() ?? 0.0,
              description: jsonBook['volumeInfo']['description'] ?? '',
              genre:
                  '', // Genre bilgisini burada belirtmiyorsunuz, eğer varsa düzeltebilirsiniz
            ))
        .toList();
  }
}
