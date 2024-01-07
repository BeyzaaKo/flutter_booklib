import 'package:books_app/setting%20widgets/forward_button.dart';
import 'package:books_app/setting%20widgets/settingItem.dart';
import 'package:books_app/setting%20widgets/setting_switch.dart';
import 'package:books_app/pages/accountEdit_page.dart';
import 'package:flutter/material.dart';

//PROFİL RESMİNİ BURDAN DÜZENLE VE USERNAME DEĞERİNİ DE DİNAMİK AL

class SettingsPage extends StatefulWidget {
  final String? username;

  const SettingsPage({Key? key, this.username}) : super(key: key);

  @override
  State<SettingsPage> createState() => _AccPageState();
}

class _AccPageState extends State<SettingsPage> {
  bool isDarkMode = false;

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
                "Settings",
                style: TextStyle(
                  color: Color.fromARGB(255, 55, 80, 44),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Account",
                style: TextStyle(
                  color: Color.fromARGB(255, 55, 80, 44),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg",
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.username}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 78, 101, 75),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                    const Spacer(),
                    //account butonu
                    ForwardButton(
                      onTap: () async {
                        final String? usernameFromSettings =
                            await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AccPage()),
                        );

                        if (usernameFromSettings != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AccPage(username: usernameFromSettings),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Settings",
                style: TextStyle(
                  color: Color.fromARGB(255, 55, 80, 44),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),

              //dil ayarı
              SettingItem(
                title: "Language",
                icon: Icons.public,
                bgColor: const Color.fromARGB(255, 250, 236, 215),
                iconColor: Colors.orange,
                value: "English",
                onTap: () {},
              ),
              const SizedBox(height: 20),

              //bildirim ayarı
              SettingItem(
                title: "Notifications",
                icon: Icons.notifications,
                bgColor: const Color.fromARGB(255, 213, 232, 247),
                iconColor: Colors.blue,
                onTap: () {},
              ),
              const SizedBox(height: 20),

              //yardım ayarı
              SettingItem(
                title: "Help",
                icon: Icons.question_mark_outlined,
                bgColor: const Color.fromARGB(255, 248, 217, 228),
                iconColor: Colors.pink,
                onTap: () {},
              ),

              SizedBox(height: 40),

              // "log out" butonu
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
                      // Çıkış yapma işlemleri burada gerçekleştirilebilir.
                      // Örneğin, yetkilendirme durumunu sıfırlayabilirsiniz.

                      // Çıkış yaptıktan sonra ana sayfaya yönlendirme işlemi:
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: const Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
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
