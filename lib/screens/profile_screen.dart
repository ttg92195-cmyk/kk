import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/theme.dart';
import '../providers/app_provider.dart';
import 'bookmark_screen.dart';
import 'recent_screen.dart';
import 'downloads_screen.dart';
import 'settings_screen.dart';
import 'account_screen.dart';
import 'admin_panel_screen.dart';
import 'tmdb_generator_screen.dart';
import 'auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileHeader(context, provider),
          const SizedBox(height: 24),
          _buildMenuSection(context, provider),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, AppProvider provider) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: AppTheme.accentColor,
            child: Icon(
              provider.isLoggedIn ? Icons.person : Icons.person_outline,
              color: Colors.black,
              size: 36,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.isLoggedIn ? provider.currentUser : 'Guest',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  provider.isLoggedIn
                      ? (provider.isAdmin ? 'Admin' : 'Member')
                      : 'Tap to login',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          if (!provider.isLoggedIn)
            IconButton(
              icon: const Icon(Icons.login, color: AppTheme.accentColor),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
            ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context, AppProvider provider) {
    return Column(
      children: [
        _menuItem(
          icon: Icons.bookmark,
          title: 'Bookmarks',
          subtitle: '${provider.bookmarks.length} saved',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BookmarkScreen())),
        ),
        _menuItem(
          icon: Icons.history,
          title: 'Recent',
          subtitle: '${provider.recentHistory.length} watched',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RecentScreen())),
        ),
        _menuItem(
          icon: Icons.download,
          title: 'Downloads',
          subtitle: '${provider.downloads.length} downloads',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DownloadsScreen())),
        ),
        _menuItem(
          icon: Icons.person,
          title: 'Account',
          subtitle: provider.isLoggedIn ? 'View account' : 'Login required',
          onTap: () {
            if (provider.isLoggedIn) {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AccountScreen()));
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
            }
          },
        ),
        _menuItem(
          icon: Icons.settings,
          title: 'Settings',
          subtitle: 'App preferences',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen())),
        ),
        if (provider.isAdmin) ...[
          _menuItem(
            icon: Icons.admin_panel_settings,
            title: 'Admin Panel',
            subtitle: 'Admin controls',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminPanelScreen())),
          ),
          _menuItem(
            icon: Icons.api,
            title: 'TMDB Generator',
            subtitle: 'Generate from TMDB',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TmdbGeneratorScreen())),
          ),
        ],
        if (provider.isLoggedIn)
          _menuItem(
            icon: Icons.logout,
            title: 'Logout',
            subtitle: 'Sign out',
            onTap: () {
              provider.logout();
              Navigator.pop(context);
            },
            isDestructive: true,
          ),
      ],
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red : AppTheme.accentColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDestructive ? Colors.red : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: AppTheme.subtitleColor, fontSize: 12)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
