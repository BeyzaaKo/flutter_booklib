//HANGİ GENRE'YA BASILIRSA ONUN LİSTE SAYFASINA YÖNLENDİRİR

import 'package:books_app/genres/app_notifier.dart';
import 'package:books_app/genres/books.dart';
import 'package:books_app/details/detail_screen.dart';
import 'package:books_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class BookList extends StatelessWidget {
  BookList({Key? key, required this.name}) : super(key: key);

  String name;

  final _random = math.Random();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        //geri dönme ikonu ve butonu
        iconTheme: IconThemeData(color: Color.fromARGB(255, 55, 80, 44)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 55, 80, 44),
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 80,

        title: Text(
          name,
          style: TextStyle(
            color: Color.fromARGB(255, 55, 80, 44),
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      //Consumer<AppNotifier>: yeniden yapılandırma yapar
      body: Consumer<AppNotifier>(
        builder: (context, value, child) {
          //FutureBuilder: widgetı günceller
          return FutureBuilder(
            //searchBookData metodu belirli bir kategoriye ait kitapları getirir
            future: value.searchBookData(searchBook: name),
            builder: (context, AsyncSnapshot<Books> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Oops! Try again later!"),
                );
              }
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: 36,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //childAspectRatio: 16 / 15,
                      crossAxisCount: 2,
                      mainAxisExtent: 260,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      //her kitap bir GestureDetector içinde yer alır ve tıklandığında DetailsScreen sayfasına geçilir
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        id: snapshot.data?.items?[index].id,
                                        boxColor: boxColors[_random.nextInt(
                                            7)], //DetailsScreen sayfasına random renk gönderiyor
                                      )));
                        },
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: LayoutBuilder(builder: (context, constraints) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: constraints.maxHeight / 2,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Container(
                                        height: constraints.maxHeight / 2.5,
                                        decoration: BoxDecoration(
                                            color:
                                                boxColors[_random.nextInt(7)],
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                      Positioned(
                                        top: 0,
                                        child: Card(
                                          margin: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: SizedBox(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image(
                                                height:
                                                    constraints.maxHeight / 2,
                                                width: constraints.maxWidth / 2,
                                                image: NetworkImage(
                                                  snapshot
                                                          ?.data
                                                          ?.items?[index]
                                                          ?.volumeInfo
                                                          ?.imageLinks
                                                          ?.thumbnail ??
                                                      "fallback_image_url",
                                                ),
                                                fit: BoxFit.fill, // use this
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Not Found"}",
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(
                                              color: Colors.grey.shade700,
                                              fontSize:
                                                  constraints.maxWidth * 0.09,
                                            ),
                                      ),
                                      Text(
                                        "${snapshot.data?.items![index].volumeInfo?.title}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(
                                                color: Color.fromARGB(
                                                    255, 55, 80, 44),
                                                fontSize:
                                                    constraints.maxWidth * 0.1,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        height: constraints.maxHeight * 0.13,
                                        width: constraints.maxWidth * 0.35,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 94, 121, 82),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Text(
                                          "${snapshot.data?.items![index].volumeInfo?.pageCount}",
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxWidth * 0.08,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.black,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
