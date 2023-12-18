//statik liste eklediğimde lazımdı, artık değil

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  State<Lists> createState() => _listsState();
}

class _listsState extends State<Lists> {
  bool lr = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    lr = false;
                  });
                },
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.list,
                      color: Color.fromARGB(255, 4, 157, 184), size: 30),
                  onPressed: () {
                    // Ana sayfaya gitme işlemleri buraya eklenir
                  },
                ),
              ],
            ), */
                    Text(
                      "📃 Saved List",
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 134, 157),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: lr == false ? 2.5 : 1,
                      color: lr == false
                          ? Color.fromARGB(255, 5, 134, 157)
                          : Color.fromARGB(127, 5, 134, 157),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    lr = true;
                  });
                },
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite,
                      color: Color.fromARGB(255, 4, 157, 184), size: 20),
                  onPressed: () {
                    // Ana sayfaya gitme işlemleri buraya eklenir
                  },
                ),
              ],
            ), */
                    Text(
                      "🤍 Favourites",
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 134, 157),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: lr == true ? 2.5 : 1,
                      color: lr == true
                          ? Color.fromARGB(255, 5, 134, 157)
                          : Color.fromARGB(127, 5, 134, 157),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
