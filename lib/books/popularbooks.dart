import 'package:flutter/material.dart';
import 'package:books_app/data/bookdata.dart';

Widget popBook(BookData book) {
  return Container(
    width: 122.0,
    margin: EdgeInsets.only(right: 12.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 121.66,
          height: 180.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
                image: NetworkImage(book.bookCover), fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        //kitap ismi
        Text(book.bookName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 94, 102, 89),
            )),
      ],
    ),
  );
}
