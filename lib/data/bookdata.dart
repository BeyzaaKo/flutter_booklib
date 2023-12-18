//KİTAPTAKİ DATA MODELİ

import 'package:books_app/api/apiService.dart';

class BookData {
  String bookCover;
  String bookName;
  String author;
  int pageNum;
  double rating;
  String description;
  String genre;

  BookData({
    required this.bookCover,
    required this.bookName,
    required this.author,
    required this.pageNum,
    required this.rating,
    required this.description,
    required this.genre,
  });

  //Factory method for creating BookData from JSON data
  factory BookData.fromJson(Map<String, dynamic> json, String genre) {
    final volumeInfo = json['volumeInfo'];
    final imageLinks = volumeInfo['imageLinks'];

    return BookData(
      bookCover: imageLinks != null ? imageLinks['thumbnail'] ?? '' : '',
      bookName: volumeInfo['title'] ?? 'Unknown Title',
      author: (volumeInfo['authors'] as List<dynamic>?)?.isNotEmpty ?? false
          ? volumeInfo['authors'][0]
          : 'Unknown Author',
      pageNum: volumeInfo['pageCount'] ?? 0,
      rating: volumeInfo['averageRating']?.toDouble() ?? 0.0,
      description: volumeInfo['description'] ?? '',
      genre: genre,
    );
  }

// Kitap verilerini API'den alma yöntemi
  static Future<BookData> fetchBookData(String bookId, String genre) async {
    final apiData = await ApiService().fetchBookDataFromApi(bookId);
    return BookData.fromJson(apiData, genre);
  }
}
