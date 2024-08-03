import 'package:fake_news/screens/testing_section.dart';
import 'package:fake_news/widgets/menu_button.dart';
import 'package:flutter/material.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      constraints: const BoxConstraints(maxHeight: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MenuButtonNav(name: "Home", myFnction: () {}),
          MenuButtonNav(
            name: "Test",
            myFnction: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TestingSection(),
                ),
              );
            },
          ),
          MenuButtonNav(
            name: "About",
            myFnction: () {},
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }
}

class HeaderTestDesktop extends StatelessWidget {
  const HeaderTestDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      constraints: const BoxConstraints(maxHeight: 60),
      child: Row(
        children: [
          MenuButtonNav(
            name: "Back to Home",
            myFnction: () {
              Navigator.of(context).pop();
            },
          ),
          Spacer(),
          MenuButtonNav(name: "About", myFnction: () {}),
          SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }
}

class HeaderAboutDesktop extends StatelessWidget {
  const HeaderAboutDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      constraints: const BoxConstraints(maxHeight: 60),
      child: Row(
        children: [
          MenuButtonNav(
            name: "Back",
            myFnction: () {
              Navigator.of(context).pop();
            },
          ),
          Spacer(),
          MenuButtonNav(name: "Home", myFnction: () {}),
          MenuButtonNav(name: "Test", myFnction: () {}),
          SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }
}
