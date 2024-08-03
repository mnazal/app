import 'dart:async';
import 'package:fake_news/utils/global_variables.dart';
import 'package:flutter/material.dart';

import 'screens/testing_section.dart';
import 'widgets/header/header_desktop.dart';
import 'widgets/components/home_page_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String typedText = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward(); // Start the animation

    // Simulate typing effect
    const String fullText = description;
    const Duration duration = Duration(milliseconds: 70);
    Timer.periodic(duration, (Timer timer) {
      if (typedText.length < fullText.length) {
        setState(() {
          typedText = fullText.substring(0, typedText.length + 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height.toDouble();
    final screenWidth = MediaQuery.of(context).size.width.toDouble();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("fakenewsjpg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            children: [
              const HeaderDesktop(),
              Padding(
                padding: EdgeInsets.only(
                  top: 0,
                  left: screenWidth / 7,
                  right: screenWidth / 7,
                ),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: screenHeight / 1.5,
                        ),
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (BuildContext context, Widget? child) {
                            return Text(
                              typedText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomePageButton(
                          named: "TestNews",
                          icon: Icons.link,
                          myFnction: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TestingSection(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        HomePageButton(
                          named: "Github",
                          icon: Icons.g_mobiledata_sharp,
                          myFnction: () {
                            print("Clicked github");
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
