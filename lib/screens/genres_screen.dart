import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../data/sample_data.dart';

class GenresScreen extends StatefulWidget {
  const GenresScreen({super.key});

  @override
  State<GenresScreen> createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> with SingleTickerProviderStateMixin {
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
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Genres'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.accentColor,
          labelColor: AppTheme.accentColor,
          unselectedLabelColor: Colors.grey,
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

  Widget _buildGenresTab() {
    final genres = SampleData.genres;
    final colors = [
      Colors.red, Colors.blue, Colors.green, Colors.orange,
      Colors.purple, Colors.teal, Colors.pink, Colors.indigo,
      Colors.brown, Colors.cyan, Colors.amber, Colors.deepOrange,
      Colors.lightGreen, Colors.deepPurple, Colors.lime,
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: genres.length,
      itemBuilder: (context, index) {
        final color = colors[index % colors.length];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.6),
                color.withOpacity(0.3),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nez7.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color.withOpacity(0.7),
                      color.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text(
                  genres[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTagsTab() {
    final tags = SampleData.tags;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: tags.map((tag) {
          final isActive = _activeTags.contains(tag);
          return GestureDetector(
            onTap: () {
              setState(() {
                if (isActive) {
                  _activeTags.remove(tag);
                } else {
                  _activeTags.add(tag);
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isActive ? AppTheme.accentColor : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isActive ? AppTheme.accentColor : Colors.red,
                  width: 1.5,
                ),
              ),
              child: Text(
                tag,
                style: TextStyle(
                  color: isActive ? Colors.black : Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCollectionsTab() {
    final collections = SampleData.collections;
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final collection = collections[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          height: 160,
          child: Stack(
            children: [
              // Stacked poster effect - background cards
              Positioned(
                left: 40,
                top: 10,
                child: Container(
                  width: 100,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppTheme.cardColor.withOpacity(0.5),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 5,
                child: Container(
                  width: 100,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppTheme.cardColor.withOpacity(0.7),
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
                    width: 100,
                    height: 140,
                    child: Image.network(
                      collection['posterUrl'] as String,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppTheme.cardColor,
                        child: const Icon(Icons.collections, color: Colors.grey, size: 30),
                      ),
                    ),
                  ),
                ),
              ),
              // Collection info
              Positioned(
                left: 120,
                top: 10,
                right: 0,
                bottom: 10,
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
                      style: const TextStyle(color: AppTheme.accentColor, fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.accentColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'View All',
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
