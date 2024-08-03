import 'package:flutter/material.dart';

class MenuButtonNav extends StatelessWidget {
  final String name;
  final VoidCallback myFnction;
  const MenuButtonNav({super.key, required this.name, required this.myFnction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
      child: TextButton(
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'DMSans',
            fontSize: 18,
            decoration: TextDecoration.underline,
            decorationColor: Colors.red, // Color of the underline
            decorationThickness: 4.0, // Thickness of the underline
          ),
        ),
        onPressed: myFnction,
      ),
    );
  }
}
