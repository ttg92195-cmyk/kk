import 'package:flutter/material.dart';
import '../config/theme.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAdminCard(
            Icons.dashboard,
            'Dashboard',
            'View app statistics and analytics',
            () {},
          ),
          _buildAdminCard(
            Icons.movie_creation,
            'Manage Movies',
            'Add, edit, or remove movies',
            () {},
          ),
          _buildAdminCard(
            Icons.tv,
            'Manage Series',
            'Add, edit, or remove series',
            () {},
          ),
          _buildAdminCard(
            Icons.people,
            'Manage Users',
            'View and manage user accounts',
            () {},
          ),
          _buildAdminCard(
            Icons.report,
            'Reports',
            'View user reports and feedback',
            () {},
          ),
          _buildAdminCard(
            Icons.server,
            'Server Status',
            'Monitor server health',
            () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAdminCard(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.accentColor, size: 28),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
