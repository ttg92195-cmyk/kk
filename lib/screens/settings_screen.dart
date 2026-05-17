import 'package:flutter/material.dart';
import '../config/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = true;
  bool _notifications = true;
  bool _autoPlay = false;
  String _quality = 'Auto';
  String _language = 'English';

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
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle('Playback'),
          _switchTile('Auto-play Trailers', _autoPlay, (v) => setState(() => _autoPlay = v)),
          _dropdownTile('Default Quality', _quality, ['Auto', '4K', '1080p', '720p', '480p'], (v) => setState(() => _quality = v)),
          _sectionTitle('Appearance'),
          _switchTile('Dark Mode', _darkMode, (v) => setState(() => _darkMode = v)),
          _dropdownTile('Language', _language, ['English', 'Myanmar', 'Thai', 'Chinese'], (v) => setState(() => _language = v)),
          _sectionTitle('Notifications'),
          _switchTile('Push Notifications', _notifications, (v) => setState(() => _notifications = v)),
          _sectionTitle('About'),
          _infoTile('App Version', '1.4.0'),
          _infoTile('Build', '3'),
          _infoTile('Developer', 'Chitminzaw'),
          const SizedBox(height: 20),
          Text(
            'Kumastream v1.4.0',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: AppTheme.accentColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _switchTile(String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SwitchListTile(
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
        value: value,
        onChanged: onChanged,
        activeColor: AppTheme.accentColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _dropdownTile(String title, String value, List<String> items, ValueChanged<String> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
        trailing: DropdownButton<String>(
          value: value,
          dropdownColor: AppTheme.cardColor,
          underline: const SizedBox(),
          icon: const Icon(Icons.arrow_drop_down, color: AppTheme.accentColor),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, style: const TextStyle(color: Colors.white, fontSize: 13)),
            );
          }).toList(),
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
        trailing: Text(value, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ),
    );
  }
}
