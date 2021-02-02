// Required imports
import 'package:flutter/material.dart';

/* Este archivo .dart simplemente tiene una función que permite llamar a los
 * iconos de Material de forma semi automática.
 */

final Map<String, IconData> _icons = {
  'add_alert_outlined': Icons.add_alert_outlined,
  'accessibility_outlined': Icons.accessibility_outlined,
  'folder_open_outlined': Icons.folder_open_outlined,
  'donut_large_outlined': Icons.donut_large_outlined,
  'input_outlined': Icons.input_outlined,
  'tune_outlined': Icons.tune_outlined,
  'list': Icons.list,
};

Icon getIcon(String iconName) {
  return Icon(_icons[iconName]);
}