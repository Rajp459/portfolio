import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 0),
      child: Column(
        children: [
          Text(
            "Projects",
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
