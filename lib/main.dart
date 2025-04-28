import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart' hide LinearGradient, Image;
import 'package:url_launcher/url_launcher.dart';

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

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 50),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedRobo(),
          MyIntro(),
        ],
      ),
    );
  }
}

class AnimatedRobo extends StatelessWidget {
  const AnimatedRobo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: ClipOval(
            child: RiveAnimation.asset(
              'assets/animations/robo.riv',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}

class MyIntro extends StatelessWidget {
  const MyIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        SizedBox(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Hello, I'm Raj Prajapati!",
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "A Passionate Flutter Developer | App Enthusiast | Problem Solver",
          style: GoogleFonts.poppins(fontSize: 18, color: Colors.brown),
        ),
        Text(
          'I build creative and user-friendly applications that make an impact.',
          style: GoogleFonts.poppins(fontSize: 18),
        ),
        Center(
          child: Text(
            '🚀 Let’s work together!',
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.brown),
          ),
        ),
      ],
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

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Highlight",
            style: GoogleFonts.robotoMono(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 1,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Currently working at ", // Normal text
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "BioTech Wallah ", // Styled part
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.tealAccent,
                        ),
                      ),
                      TextSpan(
                        text: "as a Flutter Developer Intern", // Styled part
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Text(
                    'Biotech Wallah Pvt Ltd is a cutting-edge technology company specializing in AI-driven healthcare solutions, custom software development, and SaaS platforms')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Project",
            style: GoogleFonts.robotoMono(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ProjectTile(
                  title: "Portfolio",
                  description:
                      "A responsive portfolio website showcasing my skills, projects, and experience as a Flutter developer with a clean, modern design."),
              ProjectTile(
                  title: "Weather Application",
                  description:
                      "A simple and interactive weather app displaying real-time weather updates, forecasts, and location-based climate details using a clean UI. ☁️"),
              ProjectTile(
                  title: "Chat Application",
                  description:
                      "A real-time group chat application enabling seamless messaging, media sharing, and user authentication with a clean and intuitive UI. 💬"),
              ProjectTile(
                  title: "BMI Calculator",
                  description:
                      "A simple BMI calculator app that helps users determine their Body Mass Index and assess their health status instantly. ⚖️💪"),
              ProjectTile(
                  title: "Expanse Tracker",
                  description:
                      "An intuitive expense tracker app for managing daily finances, tracking spending, and visualizing budget insights effortlessly. 💰"),
              ProjectTile(
                  title: "Student Manager",
                  description:
                      "A student management app for tracking attendance, assignments, grades, and schedules with an organized and user-friendly interface. 📚"),
              ProjectTile(
                  title: "Flutter Navigation Page",
                  description:
                      "A Flutter project demonstrating seamless navigation between pages using named routes, bottom navigation, and drawer menus"),
              ProjectTile(
                  title: "Flutter API",
                  description:
                      "A Flutter project integrating APIs to fetch and display real-time data with dynamic UI updates and smooth user experience. 🔄"),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final String title;
  final String description;
  const ProjectTile(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          maxHeight: 300, minHeight: 250, minWidth: 250, maxWidth: 300),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(description),
        ],
      ),
    );
  }
}

class Certifications extends StatelessWidget {
  const Certifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Certifications",
            style: GoogleFonts.robotoMono(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Wrap(
            alignment: WrapAlignment.start, // Ensures left alignment
            spacing: 20,
            runSpacing: 20,
            children: [
              CertificateContainer(
                  title:
                      'Operating Systems: Overview, Administration, and Security',
                  description: ''),
              CertificateContainer(
                  title: 'Introduction to Front-End Development',
                  description: ''),
              CertificateContainer(
                  title: 'Introduction to Cybersecurity Tools & Cyberattacks',
                  description: ''),
              CertificateContainer(
                  title: 'ChatGPT Prompt Engineering for Developers',
                  description: ''),
              CertificateContainer(title: 'Version Control', description: ''),
              CertificateContainer(
                  title: 'Programming With JavaScript', description: ''),
            ],
          ),
        ],
      ),
    );
  }
}

class CertificateContainer extends StatelessWidget {
  final String title;
  final String description;
  const CertificateContainer(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          maxHeight: 300, minHeight: 250, minWidth: 250, maxWidth: 300),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(description),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, contactLogoImage});

  static List<String> contactLogoImage = [
    'assets/contactLogo/linkedinlogo.png',
    'assets/contactLogo/githublogom.png',
    'assets/contactLogo/instagramlogo.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 0),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Ensures both columns start at the top
        children: [
          /// **Left Column (Project Discussion & Contact Info)**
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // Ensures consistent alignment
                  margin:
                      const EdgeInsets.only(top: 0), // Adjust spacing if needed
                  child: Text(
                    "DO YOU HAVE A PROJECT TO DISCUSS",
                    style: GoogleFonts.robotoMono(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5), // Adjust spacing
                Text(
                  "GET IN TOUCH ✉️",
                  style: GoogleFonts.robotoMono(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30), // Fix unwanted extra space
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Aligns columns properly
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'CONTACT',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: GestureDetector(
                            onTap: () async {
                              final Uri emailUri = Uri(
                                scheme: 'mailto',
                                path: 'prajapatiraj459@gmail.com',
                              );
                              if (await canLaunchUrl(emailUri)) {
                                await launchUrl(emailUri);
                              } else {
                                throw 'Could not launch $emailUri';
                              }
                            },
                            child: const Text(
                              'prajapatiraj459@gmail.com',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 40), // Adds spacing between columns
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SOCIAL MEDIA',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          children: contactLogoImage
                              .map((image) => ContactLogo(logoPath: image))
                              .toList(),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 20), // Space between columns

          /// **Right Column (Contact Form)**
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Aligns properly
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CONTACT FORM",
                  style:
                      GoogleFonts.robotoMono(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Name'),
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your name',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Email'),
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your email',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Message'),
                        const TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your message',
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            print("Form Submitted");
                          },
                          child: const Text('Send'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactLogo extends StatelessWidget {
  const ContactLogo({super.key, required this.logoPath});
  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: const BoxDecoration(shape: BoxShape.rectangle),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, right: 5),
        child: Image.asset(
          logoPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Divider(thickness: 1),
        Column(
          children: [
            Center(
              child: Text(
                '🚀 Currently Available for Freelance Work',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('© 2025 All rights reserved.'),
                Text('Built with ❤️ using Flutter')
              ],
            )
          ],
        ),
      ],
    );
  }
}
