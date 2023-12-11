//aratılan kitap verilerini Google Books API üzerinden çekmek için

import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:books_app/data/bookdata.dart';

class SearchedBookServices {
  String searchItem = Get.arguments;

  Future<List<BookData>> getSearchedBooks() async {
    try {
      print('API Started');

      var url2 = 'https://www.googleapis.com/books/v1/volumes?q=$searchItem';

      var response = await http
          .get(Uri.parse(url2))
          .timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Unable to establish connection. Please try again after some time');
      });

      if (response.statusCode == 200) {
        return _parseBookJson(response.body);
      } else {
        print('API returned status code: ${response.statusCode}');
        return [];
      }
    } on TimeoutException catch (e) {
      print('Timeout Exception: $e');
      return [];
    } catch (e) {
      print('Unexpected error: $e');
      return [];
    }
  }

  List<BookData> _parseBookJson(String jsonStr) {
    final jsonMap = convert.json.decode(jsonStr);
    final jsonList = (jsonMap['items'] as List);

    return jsonList.map((jsonBook) {
      return BookData(
        bookCover: jsonBook['volumeInfo']['imageLinks']['thumbnail'],
        bookName: jsonBook['volumeInfo']['title'] ?? 'Unknown Title',
        author:
            (jsonBook['volumeInfo']['authors'] as List<dynamic>?)?.isNotEmpty ??
                    false
                ? jsonBook['volumeInfo']['authors'][0]
                : 'Unknown Author',
        pageNum: jsonBook['volumeInfo']['pageCount'] ?? 0,
        rating: jsonBook['volumeInfo']['averageRating']?.toDouble() ?? 0.0,
        description: jsonBook['volumeInfo']['description'] ?? '',
        genre:
            '', // Genre bilgisini burada belirtmiyorsunuz, eğer varsa düzeltebilirsiniz
      );
    }).toList();
  }
}
