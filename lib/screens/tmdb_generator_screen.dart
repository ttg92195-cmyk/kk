import 'package:flutter/material.dart';
import '../config/theme.dart';

class TmdbGeneratorScreen extends StatefulWidget {
  const TmdbGeneratorScreen({super.key});

  @override
  State<TmdbGeneratorScreen> createState() => _TmdbGeneratorScreenState();
}

class _TmdbGeneratorScreenState extends State<TmdbGeneratorScreen> {
  final TextEditingController _apiKeyController = TextEditingController();
  final TextEditingController _movieIdController = TextEditingController();
  String _result = '';

  @override
  void dispose() {
    _apiKeyController.dispose();
    _movieIdController.dispose();
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
        title: const Text('TMDB Generator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TMDB Data Generator',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Fetch movie/series data from TMDB API',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _apiKeyController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter TMDB API Key',
                prefixIcon: Icon(Icons.key, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _movieIdController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter Movie/Series ID',
                prefixIcon: Icon(Icons.movie, color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result = 'Feature coming soon. Connect to TMDB API to fetch movie data automatically.';
                  });
                },
                child: const Text('Generate'),
              ),
            ),
            const SizedBox(height: 24),
            if (_result.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _result,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
