import 'package:flutter/material.dart';
import 'package:books_app/data/bookdata.dart';

Widget romance(BookData saved) {
  return Container(
    width: 100.0,
    margin: EdgeInsets.only(right: 5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 71.58,
          height: 100.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
                image: NetworkImage(saved.bookCover), fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: 5,
        ),

        //kitap ismi
        Text(saved.bookName,
            style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 108, 116, 103),
            )),
      ],
    ),
  );
}
