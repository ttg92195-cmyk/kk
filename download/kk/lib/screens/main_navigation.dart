import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../config/theme.dart';
import 'home_screen.dart';
import 'live_screen.dart';
import 'search_screen.dart';
import 'profile_screen.dart';

/// Main navigation wrapper with BottomNavigationBar (4 tabs)
/// and a NavigationDrawer for the profile menu.
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  static const List<Widget> _tabs = [
    HomeScreen(),
    LiveScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppColors.scaffoldBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_2),
            activeIcon: Icon(Iconsax.home_25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.play_circle),
            activeIcon: Icon(Iconsax.play_circle5),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal_1),
            activeIcon: Icon(Iconsax.search_normal),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            activeIcon: Icon(Iconsax.user5),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return NavigationDrawer(
      backgroundColor: AppColors.cardColor,
      indicatorColor: AppColors.primary.withValues(alpha: 0.15),
      selectedIndex: null,
      onDestinationSelected: (index) {
        Navigator.pop(context); // close drawer
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/settings');
            break;
          case 1:
            Navigator.pushNamed(context, '/signin');
            break;
        }
      },
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: AppColors.cardColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.movie_filter_rounded, color: AppColors.primary, size: 40),
              SizedBox(height: 8),
              Text(
                'Kumastream',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Your streaming companion',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Iconsax.setting_2, color: AppColors.textSecondary),
          selectedIcon: Icon(Iconsax.setting_24, color: AppColors.primary),
          label: Text('Settings'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Iconsax.logout, color: AppColors.textSecondary),
          selectedIcon: Icon(Iconsax.logout, color: AppColors.primary),
          label: Text('Sign In'),
        ),
      ],
    );
  }
}
