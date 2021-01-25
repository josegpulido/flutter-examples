// Required imports
import 'package:flutter/material.dart';

/* Este archivo .dart simplemente tiene una función que permite llamar a los
 * iconos de Material de forma semi automática.
 */

final Map<String, IconData> _icons = {
  'add_alert_outlined': Icons.add_alert_outlined,
  'accessibility_outlined': Icons.accessibility_outlined,
  'folder_open_outlined': Icons.folder_open_outlined
};

Icon getIcon(String iconName) {
  return Icon(_icons[iconName]);
}