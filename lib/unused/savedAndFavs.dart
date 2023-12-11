////statik liste eklediğimde lazımdı, artık değil

import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SavedAndFavs extends StatefulWidget {
  const SavedAndFavs({Key? key}) : super(key: key);

  @override
  State<SavedAndFavs> createState() => _SavedAndFavsState();
}

class _SavedAndFavsState extends State<SavedAndFavs> {
  bool favorite = false;
  Color mainText = Color.fromARGB(255, 5, 134, 157);
  Color secondaryText = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Book name
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    clipBehavior: Clip.antiAlias,
                    child: Icon(
                      Icons.book,
                      size: 18,
                      color: Color.fromARGB(255, 5, 134, 157),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Normal People",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: mainText),
                  ),
                ],
              ),
            ),
          ),

          //book image and fav button
          Stack(
            children: [
              //book image
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  //kapak ölçüleri
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset("lib/images/normalpeople.jpg",
                      fit: BoxFit.cover),
                ),
              ),

              //Favourite button
              Positioned(
                top: 11,
                right: 14,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(255, 241, 240, 240)
                                    .withOpacity(0.10),
                              ),
                              child: Center(
                                child: favorite == false
                                    ? const Icon(
                                        Icons.favorite,
                                        size: 17,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 17,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //Author name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Sally Rooney",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: mainText),
            ),
          ),

          const SizedBox(
            height: 1,
          ),

          //genre
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Novel",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: secondaryText),
            ),
          ),
        ],
      ),
    );
  }
}
