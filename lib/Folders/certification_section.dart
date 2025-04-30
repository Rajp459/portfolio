import 'package:flutter/material.dart' ;
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Certifications extends StatelessWidget {
  const Certifications({super.key});

  static List<Map<String, String>> certificatesContent = [
    {
      'title': 'Operating Systems: Overview, Administration, and Security',
      'description': ''
    },
    {'title': 'Introduction to Front-End Development', 'description': ''},
    {
      'title': 'Introduction to Cybersecurity Tools & Cyberattacks',
      'description': ''
    },
    {'title': 'ChatGPT Prompt Engineering for Developers', 'description': ''},
    {'title': 'Version Control', 'description': ''},
    {'title': 'Programming With JavaScript', 'description': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 0),
      child: Column(
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
                      'Operating Systems: ',
                  description: 'Overview, Administration, and Security',
                certificateLink: 'https://www.coursera.org/account/accomplishments/verify/7PMXQRKDGFHL',
                imageUrl: 'assets/images/Os.png',
              ),
              CertificateContainer(
                  title: 'Introduction to Front-End Development',
                  description: 'Authorized by meta and offered through Coursera',
                certificateLink: 'https://www.coursera.org/account/accomplishments/verify/87ZMMJ8LWZ7K',
                imageUrl: 'assets/images/frontend.png',
              ),
              CertificateContainer(
                  title: 'Introduction to Cybersecurity Tools & Cyberattacks',
                  description: 'Authorized by IBM and offered through Coursera',
                certificateLink: 'https://www.coursera.org/account/accomplishments/verify/FH75USNSKBVF',
                imageUrl: 'assets/images/cybersecurity.png',
              ),
              CertificateContainer(
                  title: 'Programming Fundamental',
                  description: 'Authorized by Duke University and offered through Coursera',
                certificateLink: 'https://www.coursera.org/account/accomplishments/verify/DR2YGP5PPMWD',
                imageUrl: 'assets/images/programmingFundamental.png',
              ),
              CertificateContainer(title: 'Version Control', description: 'Authorized by meta and offered through Coursera',
                certificateLink: 'https://www.coursera.org/account/accomplishments/verify/XDVD92QDNSCV',
                imageUrl: 'assets/images/versionControl.png',
              ),
              CertificateContainer(
                  title: 'Programming With JavaScript', description: 'Authorized by meta and offered through Coursera',
                certificateLink: 'https://www.coursera.org/account/accomplishments/verify/GFTKRSE9PSXS',
                imageUrl: 'assets/images/javaScript.png',
              ),
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
  final String imageUrl;
  final String certificateLink;
  const CertificateContainer(
      {super.key, required this.title, required this.description, required this.certificateLink, required this.imageUrl});

  void _launchURL(String url) async{
    final Uri uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }else{
      throw 'Could not launch $url';
    }
  }

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
              fontSize: 12,
            ),
          ),
          Text(description),
          const Spacer(),
          GestureDetector(
            onTap: ()=> _launchURL(certificateLink),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
