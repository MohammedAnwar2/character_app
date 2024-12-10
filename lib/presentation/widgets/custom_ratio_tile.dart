import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  final String title; // The text to display for the item
  final String value; // The value of the radio button
  final String? groupValue; // The currently selected value
  final ValueChanged<String?> onChanged; // Callback for selection changes

  const CustomRadioTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
