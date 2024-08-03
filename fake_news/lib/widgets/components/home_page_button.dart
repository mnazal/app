import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  final String named;
  final IconData icon;
  final VoidCallback myFnction;
  const HomePageButton({
    super.key,
    required this.named,
    required this.icon,
    required this.myFnction,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: myFnction,
      label: SizedBox(
        width: 90,
        height: 40,
        child: Center(
          child: Text(
            named,
            style: TextStyle(fontSize: 16, color: Colors.black), // Text style
          ),
        ), // Center the text inside the square button
      ),
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(120), // No border radius
          ),
        ),
      ),
    );
  }
}
