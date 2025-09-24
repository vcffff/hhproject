import 'package:flutter/material.dart';

class DestinationModel {
  const DestinationModel({required this.icon, required this.label});
  final String label;
  final IconData icon;
}

final destinations = [
  DestinationModel(icon: Icons.house, label: 'Home'),
  DestinationModel(icon: Icons.document_scanner_outlined, label: 'Tasks'),
  DestinationModel(icon: Icons.person, label: 'Profile'),
];

