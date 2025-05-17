import 'package:flutter/material.dart';
import 'package:ping_me/components/settings_card.dart';
import 'package:ping_me/themes/ThemeProvider.dart';
import 'package:provider/provider.dart';


class AppearanceCard extends StatelessWidget {
  const AppearanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return SettingsCard(
      icon: isDark ? Icons.nightlight : Icons.wb_sunny,
      title: 'Appearance',
      child: Wrap(
        spacing: 8,
        children: ['light', 'dark', 'corporate'].map((mode) {
          return ChoiceChip(
            label: Text(mode[0].toUpperCase() + mode.substring(1)),
            selected: themeProvider.themeLabel == mode,
            onSelected: (_) => themeProvider.toggleTheme(mode),
          );
        }).toList(),
      ),
    );
  }
}
