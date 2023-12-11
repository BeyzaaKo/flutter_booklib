//AÇILAN KİTAP SAYFASINI VE İÇİNDEKİ BİLGİLERİ GÖSTERİR

import 'package:flutter/material.dart';
import 'package:books_app/data/bookdata.dart';

class BookDetails extends StatelessWidget {
  final BookData book;
  BookDetails({required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book.bookName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Image.network(book.bookCover),
                  height: 150,
                ),
                SizedBox(height: 15),
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      //dinamik olarak api'yle alınabilen bir rating değeri
                      Stack(children: [
                        Text(
                          'Rating:',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Text(
                            '${book.rating}/5', // book.rating burada kitaptan gelen rating bilgisini temsil eder
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ]),
                      SizedBox(height: 10),
                      Text(
                        book.bookName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        book.author,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Description',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        book.description,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      )
                    ]))
              ],
            ),
          ]),
        ),
      )),
    );
  }
}
