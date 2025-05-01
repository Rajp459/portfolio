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
              child: Center(
                child: Text(
                  '🚀 Currently Available for Freelance Work',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5,),
                Text('© 2025 All rights reserved.', textAlign: TextAlign.center,),
                SizedBox(height: 5,),
                Text('Built with ❤️ using Flutter', textAlign: TextAlign.center,)
              ],
            )
          ],
        ),
      ],
    );
  }
}
