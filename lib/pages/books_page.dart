import 'package:books_app/pages/settings_page.dart';
import 'package:books_app/pages/discover_page.dart';
import 'package:books_app/pages/profile_page.dart';
import 'package:books_app/genres/books_list.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 80, 44),
        centerTitle: true,
        title: Text(
          "Books",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),

        //kategoriler iki sütunlu bir ızgara şeklinde görüntülenir
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categoriesName.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 16 / 15,
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            //her kategori ismi yazıldığında belli bir işlem yapar, BookList sayfasına geçer
            return GestureDetector(
              onTap: () {
                print(categoriesName[index]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookList(name: categoriesName[index])));
              },

              //gradient ekler
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(categoriesImage[index]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3)
                          ],
                          stops: const [0.6, 0.9],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      categoriesName[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      //navigation bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        //seçili sayfanın rengi
        selectedItemColor: Color.fromARGB(255, 121, 159, 103),
        unselectedItemColor: Color.fromARGB(255, 55, 80, 44),

        //seçili sayfanın fontu
        selectedLabelStyle: TextStyle(
          fontSize: 19.0, // Seçili olan label font büyüklüğü
          fontWeight: FontWeight.bold, // Seçili olan label font kalınlığı
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.0, // Seçili olmayan label font büyüklüğü
          fontWeight: FontWeight.w600, // Seçili olmayan label font kalınlığı
        ),

        //seçili sayfanın ikonu
        selectedIconTheme: IconThemeData(
          size: 32.0,
        ),
        unselectedIconTheme: IconThemeData(
          size: 28.0,
        ),

        //seçili sayfanın indeksi
        currentIndex: 0,

        //seçili sayfaya gitmek için
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BooksPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiscoverPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );

              break;
          }
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            label: "Books",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

List categoriesName = [
  //science, children, romance, fantasy, graphic novel, horror, historical, art, food, travel, parenting, crime,Contemporary fiction
  "Children's Fiction",
  "Fantasy",
  "Romance",
  "Historical",
  "Graphic novel",
  "Science",
  "Crime",
  "Horror",
  "Art",
  "Food",
  "Travel",
  "Parenting",
  "Contemporary Fiction"
];

List categoriesImage = [
  "https://img.freepik.com/premium-photo/child-reading-book-book-called-sun_579873-10527.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/ancient-castle-mountains-generative-ai_169016-30429.jpg?w=900&t=st=1702247345~exp=1702247945~hmac=d9ef419d25cdbeabea02139aaf2feaa08d121a98277446a62642600103e403ce",
  "https://images.unsplash.com/photo-1474552226712-ac0f0961a954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cm9tYW5jZSUyMGJvb2tzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://img.freepik.com/free-photo/vintage-marine-still-life-close-up_93675-128587.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=sph",
  "https://cdn.marvel.com/content/1x/xmenhellfire2023001_int_jpeg.jpg",
  "https://img.freepik.com/premium-photo/reading-various-literature-books-concept-science-literature_185193-116782.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://images.unsplash.com/photo-1625449281218-cbb6183f0aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y3JpbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://img.freepik.com/free-photo/darkness-night-with-skull-high-view_23-2148277555.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/view-vintage-paint-brushes-easel_23-2150315229.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/top-view-recipe-book-still-life-concept_23-2149055994.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/wing-airplane-with-city-background_1232-1308.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/family-reading-sofa_23-2147997511.jpg?size=626&ext=jpg&ga=GA1.1.941178728.1697544232&semt=ais",
  "https://img.freepik.com/free-photo/open-book-with-fairytale-scene_52683-107846.jpg?w=900&t=st=1702247098~exp=1702247698~hmac=06fd4725c028effdd587bb356ed8a83bf171a11523115a098f24380e5a88af66",
];
