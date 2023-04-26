import 'package:flutter/material.dart';
import 'designConstants.dart';

Widget buildButton({
  required String title,
  required IconData icon,
  required VoidCallback onClicked,
}) =>
    ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        textStyle: kMenuItemStyle,
      ),
      child: Row(
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 16),
          Text(title)
        ],
      ),
    );
