//KİTAP AYRINTILARINI GÖSTERMEK İÇİN

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _apiKey =
      'AIzaSyCyzDggZ-_ChpGRDcY9UQPh44tkIzOFyQU'; // Bu satırda kendi API anahtarınızı ekleyin

  Future<Map<String, dynamic>> fetchBookDataFromApi(String bookId) async {
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/books/v1/volumes/$bookId?key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load book data');
    }
  }
}
