//KİTAP BİLGİLERİ BULUNAN SAYFA

import 'package:books_app/genres/app_notifier.dart';
import 'package:books_app/details/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:books_app/constants/constants.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.id, this.boxColor}) : super(key: key);

  var id;
  final Color? boxColor;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AppNotifier>(
        builder: ((context, value, child) {
          // widget.id değerinin null olup olmadığını kontrol et
          if (widget.id == null) {
            return const Center(
              child: Text("Opps No Data Found!"),
            );
          }

          return FutureBuilder(
            future: value.showBookData(id: widget.id),
            builder: (context, AsyncSnapshot<DetailModel> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Opps! Try again later!"),
                );
              }
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        //kitabın başlangıç yeri
                        height: height * 350,
                        child: Stack(
                          children: [
                            Container(
                              width: double.maxFinite,
                              //arkadaki rengin yeri
                              height: height * 200,
                              decoration: BoxDecoration(
                                color:
                                    widget.boxColor ?? const Color(0xffF9CFE3),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(35),
                                  bottomRight: Radius.circular(35),
                                ),
                              ),
                            ),

                            //kitap kapağı ile ilgili
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                //kitabın duracağı yer
                                height: height * 250,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(26),
                                  child: Image(
                                    image: NetworkImage(
                                        "${snapshot.data?.volumeInfo?.imageLinks?.thumbnail}"),
                                    fit: BoxFit.contain,
                                    height: 288,
                                    width: 192,
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              top: 60,
                              left: 16,
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                //dış çerveçe
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(width: 1)),
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: AppColors.black,
                                ),
                                label: const Text(
                                  "",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "${snapshot.data?.volumeInfo?.title ?? "Censored"}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${snapshot.data?.volumeInfo!.authors?.length != 0 ? snapshot.data?.volumeInfo!.authors![0] : "Censored"}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 6,
                            ),

                            //listelere ekleme
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //saved list
                                OutlinedButton.icon(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(width: 1)),
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: AppColors.black,
                                  ),
                                  label: Text(
                                    "Saved List",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                //favourites
                                OutlinedButton.icon(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(width: 1)),
                                  icon: Icon(
                                    Icons.favorite_outline,
                                    color: AppColors.black,
                                  ),
                                  label: Text(
                                    "Favourites",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            SizedBox(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Publisher",
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Published Date",
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Genre",
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Pages",
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        //yayıncısı
                                        Text(
                                          "${snapshot.data?.volumeInfo?.publisher}",
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        //yayın tarihi
                                        const SizedBox(height: 8),
                                        Text(
                                          "${snapshot.data?.volumeInfo?.publishedDate}",
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(height: 8),
                                        //türü
                                        Text(
                                          "${snapshot.data?.volumeInfo?.categories?[0]}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(height: 8),
                                        //sayfa sayısı
                                        Text(
                                          "${snapshot.data?.volumeInfo?.pageCount}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            //Description
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color:
                                    widget.boxColor ?? const Color(0xffF9CFE3),
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ReadMoreText(
                                "${snapshot.data?.volumeInfo?.description}",
                                //kaç satır görüneceği
                                trimLines: 6,
                                //read more/less
                                colorClickableText: Colors.grey,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Read More',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                                trimExpandedText: ' Less',
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors.black,
              ));
            },
          );
        }),
      ),
    );
  }
}
