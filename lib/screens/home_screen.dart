import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../data/sample_data.dart';
import '../models/movie_model.dart';
import 'movie_detail_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppTheme.accentColor,
          backgroundColor: AppTheme.cardColor,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: _buildHeader(context)),
              SliverToBoxAdapter(
                child: _buildCategorySection(
                  context,
                  title: 'Movies',
                  movies: SampleData.movies,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildCategorySection(
                  context,
                  title: 'Series',
                  movies: SampleData.series,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildCategorySection(
                  context,
                  title: 'K Drama',
                  movies: SampleData.kDramaAll,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildCategorySection(
                  context,
                  title: 'Trending Movies',
                  movies: SampleData.trendingMovies,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildCategorySection(
                  context,
                  title: 'Trending Series',
                  movies: SampleData.trendingSeries,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildCategorySection(
                  context,
                  title: '4K Movies',
                  movies: SampleData.fourKMovies,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildCategorySection(
                  context,
                  title: '4K Series',
                  movies: SampleData.fourKSeries,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildCategorySection(
                  context,
                  title: 'Animation',
                  movies: SampleData.animationAll,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildCategorySection(
                  context,
                  title: 'Anime',
                  movies: SampleData.animeAll,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildCategorySection(
                  context,
                  title: 'Bollywood',
                  movies: SampleData.bollywoodAll,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 28),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          const Expanded(
            child: Text(
              'Kumastream',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.accentColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(
    BuildContext context, {
    required String title,
    required List<Movie> movies,
  }) {
    final displayMovies = movies.take(20).toList();

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          title: title,
                          movies: movies,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: AppTheme.accentColor.withOpacity(0.9),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: displayMovies.length,
              itemBuilder: (context, index) {
                return _buildMovieCard(context, displayMovies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, Movie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetailScreen(movie: movie),
          ),
        );
      },
      child: Container(
        width: 130,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppTheme.cardColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        movie.posterUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppTheme.cardColor,
                          child: Icon(
                            movie.isSeries ? Icons.tv : Icons.movie,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // IMDb rating badge (top-left, dark bg with star)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: AppTheme.accentColor, size: 10),
                          const SizedBox(width: 2),
                          Text(
                            movie.imdbRating.toString(),
                            style: const TextStyle(
                              color: AppTheme.accentColor,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Quality badge (top-right, yellow bg)
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppTheme.accentColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        movie.quality,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable screen that displays a grid of movies for a given category.
class CategoryScreen extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const CategoryScreen({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.52,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailScreen(movie: movie),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.cardColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            movie.posterUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: AppTheme.cardColor,
                              child: Icon(
                                movie.isSeries ? Icons.tv : Icons.movie,
                                color: Colors.grey,
                                size: 36,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // IMDb rating badge
                      Positioned(
                        top: 4,
                        left: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star, color: AppTheme.accentColor, size: 9),
                              const SizedBox(width: 2),
                              Text(
                                movie.imdbRating.toString(),
                                style: const TextStyle(
                                  color: AppTheme.accentColor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Quality badge
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.accentColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            movie.quality,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 7,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
