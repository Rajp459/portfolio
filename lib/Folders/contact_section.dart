import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, contactLogoImage});
  static List<Map<String, String>> contactLogos = [
    {
      'image': 'assets/contactLogo/linkedinlogo.png',
      'url': 'https://www.linkedin.com/in/rajp459/'
    },
    {
      'image': 'assets/contactLogo/githublogom.png',
      'url': 'https://github.com/Rajp459'
    },
    {
      'image': 'assets/contactLogo/instagramlogo.png',
      'url': 'https://www.linkedin.com/in/rajp459/'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Ensures both columns start at the top
            children: [
              /// **Left Column (Project Discussion & Contact Info)**
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // Ensures consistent alignment
                      margin: const EdgeInsets.only(
                          top: 0), // Adjust spacing if needed
                      child: Text(
                        "DO YOU HAVE A PROJECT TO DISCUSS",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 5), // Adjust spacing
                    Text(
                      "GET IN TOUCH ✉️",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoMono(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10), // Fix unwanted extra space
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'CONTACT',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.zero,
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
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            const Text(
                              'SOCIAL MEDIA',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Wrap(
                                children: contactLogos.map((item) {
                                  return GestureDetector(
                                    onTap: () async {
                                      final url = Uri.parse(item['url']!);
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      } else {
                                        throw 'Could not launch ${item['url']}';
                                      }
                                    },
                                    child:
                                        ContactLogo(logoPath: item['image']!),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]));
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
