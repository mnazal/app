import 'package:fake_news/widgets/header/header_desktop.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121), // Dark background
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderAboutDesktop(), // Assuming HeaderAboutDesktop is styled

            const SizedBox(height: 40.0),

            Row(
              // Center title and image
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3, // Adjust size as needed
                  child: Text(
                    'About Fake News Detection System',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Flexible(
                  flex: 2, // Adjust size as needed
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: AssetImage(
                            'fakenewsjpg.jpg'), // Replace with your image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20.0),

            Text(
              'Description:',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10.0),

            Text(
              'Your description goes here. Explain about your fake news detection system, its purpose, features, and how it works.',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 30.0),

            Text(
              'IEEE Paper Reference:',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10.0),

            Text(
              'Your IEEE paper reference details go here. Provide the title, authors, conference/journal name, publication date, and any relevant details.',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 30.0),

            Text(
              'Team Members:',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10.0),

            Column(
              // List team members with avatars (optional)
              children: const [
                TeamMemberItem(
                  name: 'John Doe',
                ), // Replace with image path
                TeamMemberItem(
                  name: 'Jane Smith',
                ), // Replace with image path
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TeamMemberItem extends StatelessWidget {
  final String name;
  final String? avatar; // Optional avatar image path

  const TeamMemberItem({
    required this.name,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (avatar != null)
          CircleAvatar(
            backgroundImage: AssetImage(avatar!),
            radius: 20.0,
          ),
        const SizedBox(width: 10.0),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
