import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/theme.dart';
import '../data/sample_data.dart';
import '../models/movie_model.dart';
import '../providers/app_provider.dart';
import 'movie_detail_screen.dart';

class GenresScreen extends StatefulWidget {
  const GenresScreen({super.key});

  @override
  State<GenresScreen> createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Set<String> _activeTags = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Browse'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.accentColor,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: AppTheme.accentColor,
          unselectedLabelColor: AppTheme.subtitleColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          tabs: const [
            Tab(text: 'Genres'),
            Tab(text: 'Tags'),
            Tab(text: 'Collections'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildGenresTab(),
          _buildTagsTab(),
          _buildCollectionsTab(),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────────
  //  GENRES TAB
  // ──────────────────────────────────────────────

  Widget _buildGenresTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movies heading
          Text(
            'Movies',
            style: TextStyle(
              color: AppTheme.accentColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildGenreGrid(SampleData.movieGenres, 'Movie'),
          const SizedBox(height: 28),
          // Series heading
          Text(
            'Series',
            style: TextStyle(
              color: AppTheme.accentColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildGenreGrid(SampleData.seriesGenres, 'Series'),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildGenreGrid(List<String> genres, String type) {
    final colors = _genreGradientColors();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: genres.length,
      itemBuilder: (context, index) {
        final color = colors[index % colors.length];
        return GestureDetector(
          onTap: () {
            final provider =
                Provider.of<AppProvider>(context, listen: false);
            final List<Movie> results = type == 'Movie'
                ? provider.getMoviesByGenre(genres[index])
                : provider.getSeriesByGenre(genres[index]);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GenreResultsScreen(
                  title: genres[index],
                  movies: results,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.7),
                  color.withOpacity(0.35),
                ],
              ),
            ),
            child: Center(
              child: Text(
                genres[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  List<Color> _genreGradientColors() {
    return const [
      Color(0xFFE53935), // red
      Color(0xFF1E88E5), // blue
      Color(0xFF43A047), // green
      Color(0xFFFB8C00), // orange
      Color(0xFF8E24AA), // purple
      Color(0xFF00897B), // teal
      Color(0xFFD81B60), // pink
      Color(0xFF3949AB), // indigo
      Color(0xFF6D4C41), // brown
      Color(0xFF00ACC1), // cyan
      Color(0xFFFFB300), // amber
      Color(0xFFF4511E), // deep orange
      Color(0xFF7CB342), // light green
      Color(0xFF5E35B1), // deep purple
      Color(0xFFC0CA33), // lime
    ];
  }

  // ──────────────────────────────────────────────
  //  TAGS TAB
  // ──────────────────────────────────────────────

  Widget _buildTagsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Movies',
            style: TextStyle(
              color: AppTheme.accentColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildTagChips(SampleData.movieTags),
          const SizedBox(height: 28),
          Text(
            'Series',
            style: TextStyle(
              color: AppTheme.accentColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildTagChips(SampleData.seriesTags),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTagChips(List<String> tags) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: tags.map((tag) {
        final isActive = _activeTags.contains(tag);
        return GestureDetector(
          onTap: () {
            final provider =
                Provider.of<AppProvider>(context, listen: false);
            final List<Movie> results = provider.getByTag(tag);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GenreResultsScreen(
                  title: tag,
                  movies: results,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: isActive
                  ? AppTheme.accentColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isActive
                    ? AppTheme.accentColor
                    : AppTheme.subtitleColor.withOpacity(0.5),
                width: 1.5,
              ),
            ),
            child: Text(
              tag,
              style: TextStyle(
                color: isActive ? Colors.black : Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ──────────────────────────────────────────────
  //  COLLECTIONS TAB
  // ──────────────────────────────────────────────

  Widget _buildCollectionsTab() {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final allCollections = [
          ...SampleData.collections,
          ...provider.customCollections,
        ];

        return Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
              itemCount: allCollections.length,
              itemBuilder: (context, index) {
                final collection = allCollections[index];
                return _buildCollectionCard(collection);
              },
            ),
            Positioned(
              bottom: 24,
              right: 24,
              child: FloatingActionButton(
                backgroundColor: AppTheme.accentColor,
                foregroundColor: Colors.black,
                onPressed: () => _showAddCollectionDialog(provider),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCollectionCard(Map<String, dynamic> collection) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 160,
      child: Row(
        children: [
          // Stacked poster effect
          SizedBox(
            width: 130,
            height: 160,
            child: Stack(
              children: [
                // Third (back) card
                Positioned(
                  left: 40,
                  top: 10,
                  child: Container(
                    width: 90,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppTheme.cardColor.withOpacity(0.4),
                    ),
                  ),
                ),
                // Second card
                Positioned(
                  left: 20,
                  top: 5,
                  child: Container(
                    width: 90,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppTheme.cardColor.withOpacity(0.65),
                    ),
                  ),
                ),
                // Front poster
                Positioned(
                  left: 0,
                  top: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 90,
                      height: 130,
                      child: Image.network(
                        collection['posterUrl'] as String,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppTheme.cardColor,
                          child: const Icon(Icons.collections,
                              color: Colors.grey, size: 30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Collection info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  collection['name'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  '${collection['count']} titles',
                  style: TextStyle(
                    color: AppTheme.accentColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 34,
                  child: ElevatedButton(
                    onPressed: () {
                      final provider = Provider.of<AppProvider>(context,
                          listen: false);
                      final results = provider.searchMovies(
                          collection['name'] as String);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GenreResultsScreen(
                            title: collection['name'] as String,
                            movies: results.isEmpty
                                ? SampleData.movies.take(6).toList()
                                : results,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.accentColor,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'View All',
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
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

  void _showAddCollectionDialog(AppProvider provider) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: AppTheme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Add Collection',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          content: TextField(
            controller: controller,
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Collection name',
              hintStyle: TextStyle(
                  color: AppTheme.subtitleColor.withOpacity(0.6)),
              filled: true,
              fillColor: AppTheme.surfaceColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(color: AppTheme.accentColor, width: 1.5),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                'Cancel',
                style: TextStyle(color: AppTheme.subtitleColor),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final name = controller.text.trim();
                if (name.isNotEmpty) {
                  provider.addCollection(
                    name,
                    'https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nez7.jpg',
                    0,
                  );
                  Navigator.pop(ctx);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.accentColor,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

// ──────────────────────────────────────────────
//  GENRE RESULTS SCREEN
// ──────────────────────────────────────────────

class GenreResultsScreen extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const GenreResultsScreen({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: movies.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.movie_filter_outlined,
                      size: 64, color: AppTheme.subtitleColor.withOpacity(0.5)),
                  const SizedBox(height: 12),
                  Text(
                    'No results found',
                    style: TextStyle(
                      color: AppTheme.subtitleColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.52,
                crossAxisSpacing: 10,
                mainAxisSpacing: 14,
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                movie.posterUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  color: AppTheme.cardColor,
                                  child: const Icon(Icons.movie,
                                      color: Colors.grey, size: 30),
                                ),
                              ),
                              // Quality badge
                              if (movie.quality.isNotEmpty)
                                Positioned(
                                  top: 6,
                                  left: 6,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: AppTheme.accentColor,
                                      borderRadius:
                                          BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      movie.quality,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              // Type badge
                              Positioned(
                                top: 6,
                                right: 6,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: movie.isSeries
                                        ? Colors.blue
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    movie.type,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.star,
                              size: 12, color: AppTheme.accentColor),
                          const SizedBox(width: 3),
                          Text(
                            movie.imdbRating.toString(),
                            style: TextStyle(
                              color: AppTheme.accentColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            movie.year,
                            style: TextStyle(
                              color: AppTheme.subtitleColor,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
