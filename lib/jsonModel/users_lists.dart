import 'package:books_app/genres/books.dart';

class User {
  String username;
  List<Books> savedList = [];
  List<Books> favoriteList = [];

  User({required this.username});
}
