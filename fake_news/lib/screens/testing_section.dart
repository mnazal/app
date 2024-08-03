import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestingSection extends StatefulWidget {
  @override
  State<TestingSection> createState() => _TestingSectionState();
}

class _TestingSectionState extends State<TestingSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final TextEditingController _textEditingController = TextEditingController();
  String typedText = '';
  bool _showCursor = false;
  List<dynamic> prediction = [];
  String result = "";
  String bank = "";
  String fake = "It is a Fake News";
  String truth = "It is a Genuine News";

  Future<void> sendRequest() async {
    // Define the URL of the API endpoint
    String url = 'http://127.0.0.1:5000/predict';
    String inputData = _textEditingController.text;
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'text': inputData}),
    );

    if (response.statusCode == 200) {
      // If the request was successful (status code 200), update the UI with the prediction
      setState(() {
        prediction = jsonDecode(response.body)['prediction'];
        (prediction.join(',') == "1") ? result = truth : result = fake;
      });
    } else {
      // If the request failed, show an error message
      setState(() {
        result = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 000),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward(); // Start the animation

    // Simulate typing effect
    const String fullText = "Check the Genuineness of news.";
    const Duration duration = Duration(milliseconds: 100);
    Timer.periodic(duration, (Timer timer) {
      if (typedText.length < fullText.length) {
        setState(() {
          typedText = fullText.substring(0, typedText.length + 1);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height.toDouble();
    final screenWidth = MediaQuery.of(context).size.width.toDouble();
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              children: [
                SizedBox(
                  height: 500,
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth / 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 60,
                                letterSpacing: 3,
                                fontFamily: 'DMSans',
                              ),
                              children: [
                                TextSpan(text: typedText),
                                if (_showCursor)
                                  WidgetSpan(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 2, bottom: 15),
                                      width: 2,
                                      height: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 40),
                              child: TextField(
                                controller: _textEditingController,
                                style: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                                maxLines:
                                    10, // Allows for unlimited lines of text
                                decoration: InputDecoration(
                                  hintText: 'Enter the news here...',
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  fillColor: Colors.white.withOpacity(0.3),
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton.icon(
                              onPressed: () {
                                String text = _textEditingController.text;
                                sendRequest();
                              },
                              label: const SizedBox(
                                width: 70,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ), // Text style
                                  ),
                                ), // Center the text inside the square button
                              ),
                              icon: const Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ), // No border radius
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  result = bank;
                                });
                              },
                              label: const SizedBox(
                                width: 70,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    'Reset',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ), // Text style
                                  ),
                                ), // Center the text inside the square button
                              ),
                              icon: const Icon(
                                Icons.refresh,
                                color: Colors.black,
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ), // No border radius
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                FadeTransition(
                  opacity: _animation,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0, top: 20),
                          child: Text(
                            'Result  \t :\t' + result,
                            style:
                                TextStyle(fontSize: 50, fontFamily: 'DMSans'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
