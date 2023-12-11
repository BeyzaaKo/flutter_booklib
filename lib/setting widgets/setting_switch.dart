import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingSwitch extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final bool value;
  final Function(bool value) onTap;
  const SettingSwitch(
      {Key? key,
      required this.title,
      required this.icon,
      required this.bgColor,
      required this.iconColor,
      required this.onTap,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 99, 100, 98),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value ? "On" : "Off",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 20),
          CupertinoSwitch(value: value, onChanged: onTap)
        ],
      ),
    );
  }
}
