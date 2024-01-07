import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:books_app/setting%20widgets/edit_item.dart';
import 'package:books_app/pages/profile_page.dart';

class AccPage extends StatefulWidget {
  final String? username;

  const AccPage({Key? key, this.username}) : super(key: key);

  @override
  State<AccPage> createState() => _AccPageState();
}

class _AccPageState extends State<AccPage> {
  String gender = "man";
  File? _selectedImage;
  bool _isImagePickerActive = false;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      }
    });
  }

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

              //profil fotoğrafı değiştirme
              EditItem(
                title: "Photo",
                widget: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: ClipOval(
                        child: _selectedImage != null
                            ? Image.file(
                                _selectedImage!,
                                width: 110,
                                height: 110,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
                                width: 110,
                                height: 110,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 94, 121, 82),
                      ),
                      child: const Text(
                        "Upload Image",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
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

              // "Save" butonu
              Center(
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color.fromARGB(255, 94, 121, 82),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProfilePage(username: widget.username)));
                    },
                    child: const Text(
                      "Save Changes",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
