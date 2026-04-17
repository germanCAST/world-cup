import 'package:flutter/material.dart';
import 'package:world_cup/core/constants/app_constants.dart';

class CountryCodeBox extends StatelessWidget {
  const CountryCodeBox({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        code.toUpperCase(),
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: AppColors.onSurface,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
