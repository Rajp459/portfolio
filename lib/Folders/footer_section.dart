import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
