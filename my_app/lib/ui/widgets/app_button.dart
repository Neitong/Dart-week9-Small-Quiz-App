import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
    {
    required this.label,
    this.onTap,
    this.onPressed,
    this.backgroundColor,
    this.width,
    this.icon,
    super.key,
  });

  final IconData? icon;
  final String label;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
