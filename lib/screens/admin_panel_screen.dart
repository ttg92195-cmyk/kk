import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/theme.dart';
import '../providers/app_provider.dart';
import '../data/sample_data.dart';
import '../models/movie_model.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  bool _initialized = false;

  static const List<String> _availableTags = [
    '4K Movies',
    'Animation',
    'Anime',
    'Bollywood',
    'K Drama',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final provider = Provider.of<AppProvider>(context, listen: false);
      for (final movie in SampleData.movies) {
        provider.addEditableMovie(movie);
      }
      for (final series in SampleData.series) {
        provider.addEditableMovie(series);
      }
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Admin Panel'),
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          final editableMovies = provider.editableMovies
              .where((m) => m.type == 'Movie')
              .toList();
          final editableSeries = provider.editableMovies
              .where((m) => m.type == 'Series')
              .toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Dashboard'),
                const SizedBox(height: 12),
                _buildDashboardCards(provider),
                const SizedBox(height: 28),
                _buildSectionTitle('Manage Movies'),
                const SizedBox(height: 4),
                Text(
                  '${editableMovies.length} movies in library',
                  style: const TextStyle(color: AppTheme.subtitleColor, fontSize: 13),
                ),
                const SizedBox(height: 12),
                ...editableMovies.map((movie) => _buildContentItem(provider, movie)),
                const SizedBox(height: 28),
                _buildSectionTitle('Manage Series'),
                const SizedBox(height: 4),
                Text(
                  '${editableSeries.length} series in library',
                  style: const TextStyle(color: AppTheme.subtitleColor, fontSize: 13),
                ),
                const SizedBox(height: 12),
                ...editableSeries.map((series) => _buildContentItem(provider, series)),
                const SizedBox(height: 28),
                _buildSectionTitle('Other Admin Tools'),
                const SizedBox(height: 12),
                _buildStaticAdminCard(
                  Icons.people,
                  'Manage Users',
                  'View and manage user accounts',
                  Colors.blue,
                ),
                const SizedBox(height: 10),
                _buildStaticAdminCard(
                  Icons.report,
                  'Reports',
                  'View user reports and feedback',
                  Colors.orange,
                ),
                const SizedBox(height: 10),
                _buildStaticAdminCard(
                  Icons.dns,
                  'Server Status',
                  'Monitor server health and uptime',
                  Colors.green,
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }

  // ── Section Title ──────────────────────────────────────────────────────
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // ── Dashboard Cards ────────────────────────────────────────────────────
  Widget _buildDashboardCards(AppProvider provider) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDashboardCard(
                icon: Icons.movie,
                label: 'Total Movies',
                count: SampleData.movies.length,
                color: AppTheme.accentColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildDashboardCard(
                icon: Icons.tv,
                label: 'Total Series',
                count: SampleData.series.length,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _buildDashboardCard(
                icon: Icons.bookmark,
                label: 'Total Bookmarks',
                count: provider.bookmarks.length,
                color: Colors.purple,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildDashboardCard(
                icon: Icons.person,
                label: 'Total Users',
                count: 1,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String label,
    required int count,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.25), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            count.toString(),
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.subtitleColor,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ── Content Item (Movie / Series) ─────────────────────────────────────
  Widget _buildContentItem(AppProvider provider, Movie item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: poster + info + trending toggle
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poster thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.posterUrl,
                  width: 60,
                  height: 85,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 85,
                      color: AppTheme.surfaceColor,
                      child: const Icon(
                        Icons.movie,
                        color: AppTheme.subtitleColor,
                        size: 28,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              // Title + year
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.year,
                      style: const TextStyle(
                        color: AppTheme.subtitleColor,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.genre,
                      style: TextStyle(
                        color: AppTheme.subtitleColor.withOpacity(0.7),
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Is Trending toggle
              Column(
                children: [
                  const Text(
                    'Trending',
                    style: TextStyle(
                      color: AppTheme.subtitleColor,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Switch(
                    value: item.isTrending,
                    activeColor: AppTheme.accentColor,
                    onChanged: (value) {
                      provider.updateMovieField(
                        item.id,
                        isTrending: value,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Tags row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tags: ',
                style: TextStyle(
                  color: AppTheme.subtitleColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: _availableTags.map((tag) {
                    final isSelected = item.tags.contains(tag);
                    return GestureDetector(
                      onTap: () {
                        final currentTags = List<String>.from(item.tags);
                        if (isSelected) {
                          currentTags.remove(tag);
                        } else {
                          currentTags.add(tag);
                        }
                        provider.updateMovieField(
                          item.id,
                          tags: currentTags,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppTheme.accentColor.withOpacity(0.2)
                              : AppTheme.surfaceColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? AppTheme.accentColor
                                : AppTheme.dividerColor,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            color: isSelected
                                ? AppTheme.accentColor
                                : AppTheme.subtitleColor,
                            fontSize: 11,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Update button
          SizedBox(
            width: double.infinity,
            height: 38,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.title} updated successfully'),
                    backgroundColor: AppTheme.successColor,
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.accentColor,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Update',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Static Admin Cards ────────────────────────────────────────────────
  Widget _buildStaticAdminCard(
    IconData icon,
    String title,
    String subtitle,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: iconColor.withOpacity(0.15),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppTheme.subtitleColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: AppTheme.subtitleColor.withOpacity(0.5),
            size: 22,
          ),
        ],
      ),
    );
  }
}
