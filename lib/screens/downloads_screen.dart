import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/theme.dart';
import '../providers/app_provider.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              onPressed: () => _showDownloadSettings(context),
            ),
          ],
          bottom: TabBar(
            indicatorColor: AppTheme.accentColor,
            indicatorWeight: 3,
            labelColor: AppTheme.accentColor,
            unselectedLabelColor: AppTheme.subtitleColor,
            labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            tabs: const [
              Tab(text: 'Movies'),
              Tab(text: 'Series'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _DownloadsListTab(type: 'Movie'),
            _DownloadsListTab(type: 'Series'),
          ],
        ),
      ),
    );
  }

  void _showDownloadSettings(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setSheetState) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const Text(
                    'Download Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Download Location Row
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppTheme.accentColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.folder,
                            color: AppTheme.accentColor,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Download Location',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                provider.downloadPath,
                                style: const TextStyle(
                                  color: AppTheme.subtitleColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Change Location Button
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return AlertDialog(
                              backgroundColor: AppTheme.cardColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: const Text(
                                'Select Download Folder',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              content: const Text(
                                'Select /kmm folder',
                                style: TextStyle(color: AppTheme.subtitleColor, fontSize: 14),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(dialogContext),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: AppTheme.subtitleColor),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    provider.setDownloadPath('/kmm');
                                    Navigator.pop(dialogContext);
                                    setSheetState(() {});
                                    Navigator.pop(sheetContext);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Download location updated!'),
                                        backgroundColor: AppTheme.successColor,
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.accentColor,
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text('Select'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.folder_open, size: 18),
                      label: const Text('Change Location'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.accentColor,
                        side: const BorderSide(color: AppTheme.accentColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Pause All / Resume All
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            provider.pauseAllDownloads();
                            Navigator.pop(sheetContext);
                          },
                          icon: const Icon(Icons.pause, size: 18),
                          label: const Text('Pause All'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            provider.resumeAllDownloads();
                            Navigator.pop(sheetContext);
                          },
                          icon: const Icon(Icons.play_arrow, size: 18),
                          label: const Text('Resume All'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.accentColor,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Clear Completed
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        final completed = provider.downloads
                            .where((d) => d.status == DownloadStatus.completed)
                            .toList();
                        for (final item in completed) {
                          provider.removeDownload(item.movie.id);
                        }
                        Navigator.pop(sheetContext);
                        if (completed.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${completed.length} completed download(s) cleared'),
                              backgroundColor: AppTheme.successColor,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.cleaning_services, size: 18),
                      label: const Text('Clear Completed'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                        side: const BorderSide(color: Colors.redAccent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _DownloadsListTab extends StatelessWidget {
  final String type;

  const _DownloadsListTab({required this.type});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final items = type == 'Movie' ? provider.movieDownloads : provider.seriesDownloads;

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == 'Movie' ? Icons.download : Icons.tv,
              color: AppTheme.subtitleColor.withOpacity(0.5),
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              type == 'Movie' ? 'No movie downloads' : 'No series downloads',
              style: const TextStyle(
                color: AppTheme.subtitleColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              type == 'Movie'
                  ? 'Download movies to watch offline'
                  : 'Download series episodes to watch offline',
              style: const TextStyle(
                color: AppTheme.subtitleColor,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _DownloadCard(item: items[index]);
      },
    );
  }
}

class _DownloadCard extends StatelessWidget {
  final DownloadItem item;

  const _DownloadCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);
    final isCompleted = item.status == DownloadStatus.completed;
    final isPaused = item.status == DownloadStatus.paused;
    final isDownloading = item.status == DownloadStatus.downloading;
    final isFailed = item.status == DownloadStatus.failed;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 60,
                height: 85,
                child: Image.network(
                  item.movie.posterUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppTheme.surfaceColor,
                    child: Icon(
                      item.movie.isSeries ? Icons.tv : Icons.movie,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    item.movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // File size
                  if (item.fileSize.isNotEmpty)
                    Text(
                      item.fileSize,
                      style: const TextStyle(
                        color: AppTheme.subtitleColor,
                        fontSize: 12,
                      ),
                    ),

                  const SizedBox(height: 6),

                  // Status text
                  if (isDownloading)
                    Text(
                      'Downloading... ${(item.progress * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                        color: AppTheme.accentColor.withOpacity(0.9),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  else if (isPaused)
                    Text(
                      'Paused • ${(item.progress * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  else if (isCompleted)
                    const Row(
                      children: [
                        Icon(Icons.check_circle, color: AppTheme.successColor, size: 14),
                        SizedBox(width: 4),
                        Text(
                          'Completed',
                          style: TextStyle(
                            color: AppTheme.successColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  else if (isFailed)
                    const Text(
                      'Failed',
                      style: TextStyle(
                        color: AppTheme.errorColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  // Progress bar (not for completed)
                  if (!isCompleted) ...[
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: isFailed ? null : item.progress,
                        backgroundColor: Colors.white.withOpacity(0.1),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isPaused
                              ? Colors.orange
                              : isFailed
                                  ? AppTheme.errorColor
                                  : AppTheme.accentColor,
                        ),
                        minHeight: 5,
                      ),
                    ),
                  ],

                  // Speed text when downloading
                  if (isDownloading && item.speed.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.speed,
                      style: const TextStyle(
                        color: AppTheme.subtitleColor,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Control buttons
            const SizedBox(width: 8),
            Column(
              children: [
                if (isDownloading)
                  _CircleButton(
                    icon: Icons.pause,
                    color: AppTheme.accentColor,
                    onTap: () => provider.pauseDownload(item.movie.id),
                    tooltip: 'Pause',
                  )
                else if (isPaused)
                  _CircleButton(
                    icon: Icons.play_arrow,
                    color: AppTheme.accentColor,
                    onTap: () => provider.resumeDownload(item.movie.id),
                    tooltip: 'Resume',
                  )
                else if (isCompleted) ...[
                  _CircleButton(
                    icon: Icons.play_arrow,
                    color: AppTheme.accentColor,
                    onTap: () {
                      // Watch now action placeholder
                    },
                    tooltip: 'Watch Now',
                  ),
                  const SizedBox(height: 8),
                  _CircleButton(
                    icon: Icons.delete_outline,
                    color: Colors.redAccent,
                    onTap: () => provider.removeDownload(item.movie.id),
                    tooltip: 'Delete',
                  ),
                ],
                if (isFailed)
                  _CircleButton(
                    icon: Icons.refresh,
                    color: AppTheme.accentColor,
                    onTap: () => provider.resumeDownload(item.movie.id),
                    tooltip: 'Retry',
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final String tooltip;

  const _CircleButton({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Tooltip(
        message: tooltip,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
      ),
    );
  }
}
