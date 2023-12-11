import 'package:books_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:books_app/data/bookdata.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<BookData> saved = [];

  List<BookData> fav = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 80, 44),
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            //geri dönme butonu
            Icons.arrow_back_ios,
            color: Colors.white, //Color.fromARGB(255, 4, 157, 184),
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white, //Color.fromARGB(255, 4, 157, 184),
              size: 24,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // Burada profil bilgileri veya başka öğeler olabilir
            // SliverAppBar veya SliverPersistentHeader gibi
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20), // Üstten boşluk
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("lib/images/avatar.png"),
                  ),
                ),
                //Padding(
                //padding: const EdgeInsets.only(left: 20, top: 0),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UserName",
                        style: TextStyle(
                          color: Color.fromARGB(255, 75, 110, 60),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1.5, // Çizgi kalınlığı
                        width: double.infinity, // Çizgi genişliği
                        color: Color.fromARGB(255, 75, 110, 60),
                      ),
                      /* //FOLLOWLAMA İŞLEMİ AMA YAPMAK İSTEDİĞİMDEN EMİN DEĞİLİM
                      ElevatedButton(
                        onPressed: () {
                          // Follow butonuna tıklandığında yapılacak işlemler buraya eklenir.
                        },
                        child: Text("Follow"),
                      ),*/
                    ],
                  ),
                ),
                SizedBox(height: 15),

                //liste görünümü oluşturma
                //kaydedilenler için
                /*Container(
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "📃 Saved List",
                        style: TextStyle(
                          color: Color.fromARGB(255, 55, 80, 44),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12), // Altından boşluk

                Container(
                  width: double.infinity,
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      mySaved(saved[0]),
                      mySaved(saved[1]),
                      mySaved(saved[2]),
                      mySaved(saved[3]),
                      mySaved(saved[3]),
                    ],
                  ),
                ),

                SizedBox(height: 16), // Altından boşluk

                //favoriler için
                Container(
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "🤍 Favourites",
                        style: TextStyle(
                          color: Color.fromARGB(255, 55, 80, 44),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      myFavs(fav[0]),
                      myFavs(fav[1]),
                      myFavs(fav[2]),
                      myFavs(fav[3]),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
