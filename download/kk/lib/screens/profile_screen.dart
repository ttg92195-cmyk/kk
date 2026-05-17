import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/theme.dart';
import '../providers/app_provider.dart';

/// Profile page showing user info, membership, and menu items.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.scaffoldBackground,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── User Info ──────────────────────────────────────────────
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.surface,
                    child: const Icon(
                      Icons.person,
                      color: AppColors.primary,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Chitminzaw',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'OPPO A16',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '1/2 Devices',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ── Membership Status ──────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.workspace_premium,
                        color: AppColors.primary,
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        provider.isPremium
                            ? 'Premium Member'
                            : 'Not Premium Member',
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Valid Until: ${provider.isPremium ? '2025-12-31' : 'N/A'}',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ── Menu Items ─────────────────────────────────────────────
            _MenuTile(
              icon: Icons.person_outline,
              title: 'Account',
              subtitle: 'Chitminzaw • OPPO A16 • 1/2 Devices',
              onTap: () {},
            ),
            _MenuTile(
              icon: Icons.bookmark_outline,
              title: 'Bookmark',
              subtitle: '${provider.bookmarks.length} saved movies',
              onTap: () {},
            ),
            _MenuTile(
              icon: Icons.lock_outline,
              title: 'Adult (18+)',
              trailing: Switch(
                value: provider.adultContentEnabled,
                onChanged: (_) => provider.toggleAdult(),
                activeThumbColor: AppColors.primary,
              ),
              onTap: () => provider.toggleAdult(),
            ),
            _MenuTile(
              icon: Icons.download_outlined,
              title: 'Download',
              subtitle: 'Manage download location',
              onTap: () {
                _showDownloadLocationDialog(context);
              },
            ),
            _MenuTile(
              icon: Icons.category_outlined,
              title: 'Genres',
              onTap: () {
                _showGenresDialog(context);
              },
            ),
            _MenuTile(
              icon: Icons.people_outline,
              title: 'Actors',
              onTap: () {},
            ),
            _MenuTile(
              icon: Icons.help_outline,
              title: 'Help Center',
              onTap: () {},
            ),
            _MenuTile(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            _MenuTile(
              icon: Icons.restart_alt,
              title: 'Restart App',
              onTap: () {
                // Restart app logic
              },
            ),

            const SizedBox(height: 24),

            // ── Logout Button ──────────────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  provider.logout();
                  Navigator.pushReplacementNamed(context, '/signin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  foregroundColor: AppColors.textPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _showDownloadLocationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardColor,
        title: const Text('Download Location'),
        content: const Text(
          '/storage/emulated/0/Kumastream',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showGenresDialog(BuildContext context) {
    const genres = [
      'Drama', 'Action', 'Thriller', 'Comedy', 'Sci-Fi',
      'Horror', 'Romance', 'Fantasy', 'Crime', 'War',
      'Animation', 'Documentary', 'Mystery', 'Adventure',
    ];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardColor,
        title: const Text('Genres'),
        content: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: genres.map((g) => Chip(label: Text(g))).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary, size: 22),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            )
          : null,
      trailing: trailing ??
          const Icon(Icons.chevron_right, color: AppColors.textSecondary),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
