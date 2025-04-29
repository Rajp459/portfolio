import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key, skillImages});

  // List of skills (Replace with actual image paths)
  static List<String> skillImages = [
    'assets/logo/flutterlogo.png',
    'assets/logo/dartlogo.png',
    'assets/logo/firebaselogo.png',
    'assets/logo/javascriptlogo.png',
    'assets/logo/chatgptlogo.png',
    'assets/logo/gitlogo.png',
    'assets/logo/githublogo.png',
    'assets/logo/clogo.png',
    'assets/logo/javalogo.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Heading
          Text(
            "My Skills",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),

          // Skill Description
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text:
              'Crafting beautiful, high-performance apps with Flutter and a passion for innovation!\n',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.black87,
              ),
              children: [
                TextSpan(
                  text:
                  'These are the tools I use to paint digital experiences.',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.brown,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Skill Logos Grid
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: skillImages
                .map((image) => SkillLogo(imagePath: image))
                .toList(),
          ),
        ],
      ),
    );
  }
}