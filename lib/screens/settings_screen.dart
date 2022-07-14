import 'package:flutter/material.dart';
import 'package:pfoten/reuasble/customAppBar.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Settings",
        isBackButtonExist: false,
        isAction: false,
        backOnTap: () {
          Navigator.pop(context);
        },
        iconData: Icons.create_outlined,
        iconOnTap: () {},
      ),
      body: SettingsList(
        lightTheme: const SettingsThemeData(
          settingsListBackground: kColorWhite
        ),
        sections: [
          SettingsSection(
            title: const Text('Preferences'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.favorite_border),
                title: const Text('Favorites'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Content'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                value: const Text('English'),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.shield_moon_outlined),
                title: const Text('Dark Mode'),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
