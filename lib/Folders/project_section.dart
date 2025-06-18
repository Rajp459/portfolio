import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/repos_list_model.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({super.key});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {

  List<ReposListModel?>? _reposListModel;

  Future<List<ReposListModel?>?> getRepos() async {


    var dio = Dio();
    var response = await dio.request(
      'https://api.github.com/users/Rajp459/repos?sort=updated&direction=desc',
      options: Options(
        method: 'GET',
      ),
    );
    if (response.statusCode == 200) {
      setState(() {
        _reposListModel = (response.data as List)
            .map((repoJson) => ReposListModel.fromJson(repoJson))
            .toList();
      });
      // print(response);
    }
    else {
      if (kDebugMode) {
        print(response.statusMessage);
      }
    }
    return _reposListModel;
    }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 0),
        child: _reposListModel == null
            ? const Center(child: CircularProgressIndicator())
            : _reposListModel!.isEmpty
            ? const Center(child: Text("No projects found."))
            : Wrap(
          spacing: 20,
          runSpacing: 20,
          children: _reposListModel!.take(8).map((repo) {
            return ProjectTile(
              title: repo?.fullName ?? "No Title",
              description: repo?.description ?? "No Description",
              stars: repo?.stargazersCount ?? 0,
              forks: repo?.forksCount ?? 0,
              language: repo?.language ?? "Unknown",
              url: repo?.htmlUrl ?? "",
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final String title;
  final String description;
  final String language;
  final int stars;
  final int forks;
  final String url;

  const ProjectTile({
    super.key,
    required this.title,
    required this.description,
    required this.language,
    required this.stars,
    required this.forks,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)), // Requires url_launcher
      child: Container(
        constraints: const BoxConstraints(
            maxHeight: 200, minHeight: 150, minWidth: 250, maxWidth: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
                description, style: GoogleFonts.poppins(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('⭐ $stars', style: GoogleFonts.poppins(fontSize: 14),),
                Text('🍴 $forks', style: GoogleFonts.poppins(fontSize: 14)),
                Text('💻 $language', style: GoogleFonts.poppins(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


