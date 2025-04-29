import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Folders/project_section.dart';
import 'Folders/about.dart';
import 'Folders/certification_section.dart';
import 'Folders/contact_section.dart';
import 'Folders/footer_section.dart';
import 'Folders/hero_section.dart';
import 'Folders/skill_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(),
          brightness: Brightness.light,
          dividerColor: Colors.black,
          textSelectionTheme: const TextSelectionThemeData()),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5ee7df), // Dark blue
              Color(0xFFb490ca), // Teal shade
              //Color(0xFF2C5364),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          children: const [
            //AnimatedRobo(),
            HeroSection(),
            AboutSection(),
            SkillSection(),
            ProjectSection(),
            Certifications(),
            ContactSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class MySelfPhoto extends StatelessWidget {
  const MySelfPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 16, bottom: 8, left: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.center, // Centers the image vertically
        children: [
          Container(
            width: 210, // Slightly larger than the image for border effect
            height: 210,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.green, width: 5), // Change color as needed
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/RajPphoto.jpg',
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillLogo extends StatelessWidget {
  final String imagePath;

  const SkillLogo({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(2),
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// Wrap(
// alignment: WrapAlignment.start, // Ensures left alignment
// spacing: 20,
// runSpacing: 20,
// children: certificatesContent.map((cert){
// return ListTile(
// title: Text(cert['title']?? ''),
// subtitle: Text(cert['description']?? 'no description'),
// );
// }).toList(),
// ),
