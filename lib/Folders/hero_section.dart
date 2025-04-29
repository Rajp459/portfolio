import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';


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