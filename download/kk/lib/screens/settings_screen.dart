import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/theme.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

/// Settings page with notification toggle, adult content toggle,
/// video player selector, and app version display.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Notification Toggle ────────────────────────────────────────
          _SettingsTile(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            trailing: Switch(
              value: provider.notificationEnabled,
              onChanged: (_) => provider.toggleNotification(),
              activeTrackColor: AppColors.primary.withOpacity(0.5),
              activeThumbColor: AppColors.primary,
            ),
          ),
          const Divider(color: AppColors.divider),

          // ── Adult Content Toggle ───────────────────────────────────────
          _SettingsTile(
            icon: Icons.shield_outlined,
            title: 'Adult Content',
            subtitle: 'Enable 18+ content (Warning: explicit content)',
            trailing: Switch(
              value: provider.adultContentEnabled,
              onChanged: (_) => provider.toggleAdult(),
              activeTrackColor: AppColors.primary.withOpacity(0.5),
              activeThumbColor: AppColors.primary,
            ),
          ),
          const Divider(color: AppColors.divider),

          // ── Video Player Selector ──────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.play_circle_outline,
                        color: AppColors.textSecondary, size: 22),
                    SizedBox(width: 12),
                    Text(
                      'Video Player',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                ...AppConstants.playerOptions.map((option) {
                  return RadioListTile<String>(
                    title: Text(option),
                    value: option,
                    groupValue: provider.selectedPlayer,
                    onChanged: (value) {
                      if (value != null) provider.setPlayer(value);
                    },
                    activeColor: AppColors.primary,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    controlAffinity: ListTileControlAffinity.trailing,
                  );
                }),
              ],
            ),
          ),
          const Divider(color: AppColors.divider),

          // ── App Version ────────────────────────────────────────────────
          _SettingsTile(
            icon: Icons.info_outline,
            title: 'App Version',
            trailing: Text(
              'v${AppConstants.version}',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  SETTINGS TILE
// ═══════════════════════════════════════════════════════════════════════════════

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.textSecondary, size: 22),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            )
          : null,
      trailing: trailing,
    );
  }
}
