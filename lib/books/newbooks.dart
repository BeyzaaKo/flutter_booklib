import 'package:books_app/data/bookdata.dart';
import 'package:flutter/material.dart';

Widget newBook(BookData book) {
  return Container(
    width: double.infinity,
    height: 150,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 8),
          height: 128,
          width: 83,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
                image: NetworkImage(book.bookCover), fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.bookName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 74, 86, 67),
                ),
              ),
              SizedBox(height: 2),
              Text(
                book.author,
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 139, 135, 135)),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.content_copy, color: Colors.grey),
                  Text(
                    book.pageNum.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                  SizedBox(width: 8.0),
                  Icon(Icons.star, color: Colors.grey),
                  Text(
                    book.rating.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
        Icon(Icons.bookmark_border, color: Colors.grey),
      ],
    ),
  );
}
