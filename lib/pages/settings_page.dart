import 'package:books_app/setting%20widgets/forward_button.dart';
import 'package:books_app/setting%20widgets/settingItem.dart';
import 'package:books_app/setting%20widgets/setting_switch.dart';
import 'package:books_app/pages/accountEdit_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
        /* DÜZENLEME BUTONU
        actions: [
          IconButton(
            icon: Icon(
              Icons.mode_edit_outline_rounded,
              color: Color.fromARGB(255, 55, 80, 44),
              size: 20,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AccPage()));
            },
          ),
        ], */
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
                    Image.asset("lib/images/avatar.png", width: 65, height: 65),
                    const SizedBox(width: 20),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(
                              color: Color.fromARGB(255, 52, 61, 51),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "user@email.com",
                          style: TextStyle(
                            color: Color.fromARGB(255, 144, 148, 143),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    //account butonu
                    ForwardButton(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AccPage()));
                      },
                    )
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

              //koyu tema ayarı
              SettingSwitch(
                title: "Dark Mode",
                icon: Icons.dark_mode,
                bgColor: Color.fromARGB(255, 243, 226, 252),
                iconColor: const Color.fromARGB(255, 147, 7, 228),
                value: isDarkMode,
                onTap: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
