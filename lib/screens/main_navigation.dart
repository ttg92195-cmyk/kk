import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/theme.dart';
import '../providers/app_provider.dart';
import 'home_screen.dart';
import 'movies_screen.dart';
import 'series_screen.dart';
import 'search_screen.dart';
import 'profile_screen.dart';
import 'bookmark_screen.dart';
import 'recent_screen.dart';
import 'downloads_screen.dart';
import 'genres_screen.dart';
import 'settings_screen.dart';
import 'account_screen.dart';
import 'admin_panel_screen.dart';
import 'tmdb_generator_screen.dart';
import 'auth/login_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = const [
    HomeScreen(),
    MoviesScreen(),
    SeriesScreen(),
    ProfileScreen(),
  ];

  void _navigateFromDrawer(String title) {
    Navigator.pop(context);
    switch (title) {
      case 'Home':
        setState(() => _currentIndex = 0);
        break;
      case 'Movies':
        setState(() => _currentIndex = 1);
        break;
      case 'Series':
        setState(() => _currentIndex = 2);
        break;
      case 'Bookmark':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const BookmarkScreen()));
        break;
      case 'Recent':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const RecentScreen()));
        break;
      case 'Downloads':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const DownloadsScreen()));
        break;
      case 'Genres':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const GenresScreen()));
        break;
      case 'Settings':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
        break;
      case 'Account':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const AccountScreen()));
        break;
      case 'Login':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
        break;
      case 'Admin Panel':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminPanelScreen()));
        break;
      case 'TMDB Generator':
        Navigator.push(context, MaterialPageRoute(builder: (_) => const TmdbGeneratorScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(provider),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Series',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(AppProvider provider) {
    return Drawer(
      child: Container(
        color: AppTheme.primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppTheme.secondaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppTheme.accentColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.play_circle_fill,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Kumastream',
                    style: TextStyle(
                      color: AppTheme.accentColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    provider.isLoggedIn
                        ? 'Welcome, ${provider.currentUser}'
                        : 'Welcome to Kumastream',
                    style: const TextStyle(
                      color: AppTheme.subtitleColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            _drawerItem(Icons.home, 'Home'),
            _drawerItem(Icons.movie, 'Movies'),
            _drawerItem(Icons.tv, 'Series'),
            _drawerItem(Icons.bookmark, 'Bookmark'),
            _drawerItem(Icons.history, 'Recent'),
            _drawerItem(Icons.download, 'Downloads'),
            _drawerItem(Icons.category, 'Genres'),
            const SizedBox(height: 8),
            _drawerItem(Icons.settings, 'Settings'),
            if (provider.isLoggedIn)
              _drawerItem(Icons.person, 'Account')
            else
              _drawerItem(Icons.login, 'Login'),
            if (provider.isAdmin) ...[
              const SizedBox(height: 8),
              _drawerItem(Icons.admin_panel_settings, 'Admin Panel'),
              _drawerItem(Icons.api, 'TMDB Generator'),
            ],
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.subtitleColor, size: 22),
      title: Text(
        title,
        style: const TextStyle(color: AppTheme.textColor, fontSize: 15),
      ),
      onTap: () => _navigateFromDrawer(title),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }
}
