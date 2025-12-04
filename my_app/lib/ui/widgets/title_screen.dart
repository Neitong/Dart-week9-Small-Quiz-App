// lib/ui/widgets/choice_tile.dart
import 'package:flutter/material.dart';

class ChoiceTile extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool showResult;
  final bool isCorrect;
  final VoidCallback onTap;

  const ChoiceTile({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.showResult,
    required this.isCorrect,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    Color? borderColor = Colors.grey.shade300;

    if (showResult) {
      if (isCorrect) {
        backgroundColor = Colors.green.withOpacity(0.2);
        borderColor = Colors.green;
      } else if (isSelected) {
        backgroundColor = Colors.red.withOpacity(0.2);
        borderColor = Colors.red;
      }
    } else if (isSelected) {
      backgroundColor = Colors.deepPurple.withOpacity(0.15);
      borderColor = Colors.deepPurple;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColor!, width: 2),
      ),
      color: backgroundColor,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        title: Text(text, style: const TextStyle(fontSize: 16)),
        trailing: showResult
            ? Icon(isCorrect ? Icons.check_circle : Icons.cancel, 
                color: isCorrect ? Colors.green : Colors.red)
            : (isSelected ? const Icon(Icons.check, color: Colors.deepPurple) : null),
        onTap: onTap,
      ),
    );
  }
}