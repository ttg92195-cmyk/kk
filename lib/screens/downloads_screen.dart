import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/theme.dart';
import '../providers/app_provider.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final downloads = provider.downloads;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Downloads'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () => _showDownloadSettings(context, provider),
          ),
        ],
      ),
      body: downloads.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.download, color: Colors.grey, size: 60),
                  SizedBox(height: 16),
                  Text(
                    'No downloads yet',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Download movies to watch offline',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: downloads.length,
              itemBuilder: (context, index) {
                final item = downloads[index];
                return _buildDownloadCard(context, item, provider);
              },
            ),
    );
  }

  Widget _buildDownloadCard(BuildContext context, DownloadItem item, AppProvider provider) {
    final isCompleted = item.status == DownloadStatus.completed;
    final isPaused = item.status == DownloadStatus.paused;
    final isDownloading = item.status == DownloadStatus.downloading;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 60,
                height: 85,
                child: Image.network(
                  item.movie.posterUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppTheme.secondaryColor,
                    child: const Icon(Icons.movie, color: Colors.grey, size: 25),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.movie.title,
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  if (isCompleted)
                    const Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Downloaded',
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ],
                    )
                  else ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: item.progress,
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.accentColor),
                        minHeight: 6,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isPaused ? 'Paused • ${(item.progress * 100).toStringAsFixed(0)}%' : '${(item.progress * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (!isCompleted)
              IconButton(
                icon: Icon(
                  isPaused ? Icons.play_arrow : Icons.pause,
                  color: AppTheme.accentColor,
                ),
                onPressed: () {
                  if (isPaused) {
                    provider.resumeDownload(item.movie.id);
                  } else {
                    provider.pauseDownload(item.movie.id);
                  }
                },
              ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.red, size: 20),
              onPressed: () => provider.removeDownload(item.movie.id),
            ),
          ],
        ),
      ),
    );
  }

  void _showDownloadSettings(BuildContext context, AppProvider provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Download Settings',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _settingRow(Icons.folder, 'Download Location', '/kmm'),
              const SizedBox(height: 12),
              _settingRow(Icons.info_outline, 'How Downloads Work', 'Downloads are saved for offline viewing'),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        provider.pauseAllDownloads();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Pause All', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        provider.resumeAllDownloads();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accentColor,
                      ),
                      child: const Text('Resume All', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _settingRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.accentColor, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
