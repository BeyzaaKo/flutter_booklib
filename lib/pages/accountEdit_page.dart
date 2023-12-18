import 'package:books_app/setting%20widgets/edit_item.dart';
import 'package:books_app/pages/profile_page.dart';
import 'package:flutter/material.dart';

class AccPage extends StatefulWidget {
  const AccPage({Key? key}) : super(key: key);

  @override
  State<AccPage> createState() => _AccPageState();
}

class _AccPageState extends State<AccPage> {
  String gender = "man";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              style: IconButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 94, 121, 82),
                shape: CircleBorder(),
                padding: EdgeInsets.all(7),
                fixedSize: Size(45, 45),
                elevation: 10,
              ),
              icon: const Icon(Icons.check),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Account",
                style: TextStyle(
                  color: Color.fromARGB(255, 55, 80, 44),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              EditItem(
                title: "Photo",
                widget: Column(
                  children: [
                    Image.asset(
                      "lib/images/avatar.png",
                      width: 90,
                      height: 90,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 94, 121, 82),
                      ),
                      child: const Text("Upload Image"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              //isim değiştirme
              EditItem(
                title: "Name",
                widget: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter your name", // Etiket metni
                    labelStyle: TextStyle(
                        color: Colors.grey.shade600), // Etiket stilini ayarla
                    border: OutlineInputBorder(), // Dış çerçeve oluştur
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 94, 121, 82),
                      ), // Odaklandığında çerçeve rengini ayarla
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              //cinsiyet ayarı
              EditItem(
                title: "Gender",
                widget: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = "man";
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: gender == "man"
                              ? const Color.fromARGB(255, 92, 143, 71)
                              : const Color.fromARGB(255, 214, 213, 213),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.male,
                          color: gender == "man"
                              ? Colors.white
                              : const Color.fromARGB(255, 90, 89, 89),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = "woman";
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: gender == "woman"
                              ? const Color.fromARGB(255, 92, 143, 71)
                              : const Color.fromARGB(255, 214, 213, 213),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.female,
                          color: gender == "woman"
                              ? Colors.white
                              : const Color.fromARGB(255, 90, 89, 89),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const EditItem(
                widget: TextField(),
                title: "Age",
              ),
              const SizedBox(height: 40),
              const EditItem(
                widget: TextField(),
                title: "E-mail",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
