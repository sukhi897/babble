import 'package:flutter/material.dart';

class CustomSnackbar {
  CustomSnackbar({
    required this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
    this.backgroundColor,
  });

  final IconData icon;
  final String text;
  Color? iconColor;
  Color? textColor;
  Color? backgroundColor;

  void show(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        // action: SnackBarAction(
        //   label: 'X',
        //   onPressed: () {
        //     print("Click is registered, good sir.");
        //   },
        // ),
        content: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? Colors.amber,
              size: 30.0,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor ?? Colors.white,
        duration: const Duration(milliseconds: 3000),
        // width: 350.0, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        // margin: const EdgeInsets.symmetric(
        //   horizontal: 0.0,
        //   vertical: 0.0,
        // ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ));
  }
}
