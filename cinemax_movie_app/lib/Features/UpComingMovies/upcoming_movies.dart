import 'package:cinemax_movie_app/Core/Shared/Customs/custom_app_bar.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/upcoming_movie_card.dart';
import 'package:cinemax_movie_app/Core/Shared/widgets/upcoming_movie_category.dart';
import 'package:flutter/material.dart';

class UpcomingMoviesView extends StatefulWidget {
  const UpcomingMoviesView({super.key});
  static const String routeName = "UpcomingMovies";

  @override
  State<UpcomingMoviesView> createState() => _UpcomingMoviesViewState();
}

class _UpcomingMoviesViewState extends State<UpcomingMoviesView> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomAppBar(hasLoveIcon: false, text: "Upcoming Movies"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryItem(
                          name: "All",
                          isSelected: selectedCategory == "All",
                          onTap: () {
                            setState(() {
                              selectedCategory = "All";
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        CategoryItem(
                          name: "Comedy",
                          isSelected: selectedCategory == "Comedy",
                          onTap: () {
                            setState(() {
                              selectedCategory = "Comedy";
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        CategoryItem(
                          name: "Animation",
                          isSelected: selectedCategory == "Animation",
                          onTap: () {
                            setState(() {
                              selectedCategory = "Animation";
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        CategoryItem(
                          name: "Action",
                          isSelected: selectedCategory == "Action",
                          onTap: () {
                            setState(() {
                              selectedCategory = "Action";
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // Adjust this value as needed
                  const MovieFullCard(),
                  const MovieFullCard(),
                  const MovieFullCard(),
                  const SizedBox(height: 20), // Adjust this value as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
