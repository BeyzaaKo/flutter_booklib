//DISCOVER SAYFASINDAKİ SERACH KISMI İÇİN

import 'package:http/http.dart' as http;

Future<void> searchBooks(String query) async {
  final apiKey =
      'AIzaSyCyzDggZ-_ChpGRDcY9UQPh44tkIzOFyQU'; // Google Books API anahtarım
  final apiUrl =
      'https://www.googleapis.com/books/v1/volumes?q=$query&key=$apiKey';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // Başarılı bir şekilde cevap alındı
    print('API Cevabı: ${response.body}');
  } else {
    // Hata durumunda
    print('Hata: ${response.reasonPhrase}');
  }
}
