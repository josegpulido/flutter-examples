// Required imports
import 'package:flutter/material.dart';
// Providers
import 'package:qr_scanner/providers/preferences_provider.dart';

// Widget
class SettingsPage extends StatefulWidget {

  // State builder
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

// State
class _SettingsPageState extends State<SettingsPage> {

  // Variables
  bool switchValue;

  // Providers
  final PreferencesProvider preferences = PreferencesProvider();

  // Arranque del state
  @override
  void initState() {
    // Asignando valor al Switch según las preferencias anteriores del usuario
    switchValue = preferences.theme == 'dark' ?? false;
    super.initState();
  }

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: Text('Modo oscuro'),
          subtitle: Text('Ideal para cuidar la vista por las noches.'),
          value: switchValue,
          onChanged: (bool darkMode) {
            if (darkMode) {
              preferences.theme = 'dark';
            } else {
              preferences.theme = 'light';
            }
            preferences.themeSink(darkMode);
            setState(() {
              switchValue = darkMode;
            });
          }
        )
      ]
    );
  }
}