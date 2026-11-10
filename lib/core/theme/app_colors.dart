import 'package:flutter/material.dart';

/// Corvista palette. Dark-first; light variants for parked/daytime settings use.
abstract final class AppColors {
  static const background = Color(0xFF080C12);
  static const surface = Color(0xFF111923);
  static const elevated = Color(0xFF1B2732);
  static const textPrimary = Color(0xFFF5F8FC);
  static const textSecondary = Color(0xFF9AA9B8);
  static const cyan = Color(0xFF38D9E8);
  static const blue = Color(0xFF4C80FF);
  static const green = Color(0xFF65DBAA);
  static const amber = Color(0xFFFFCB65);
  static const red = Color(0xFFF16B70);
  static const border = Color(0xFF293747);

  /// Translucent HUD panel fill over camera/map content.
  static const glass = Color(0xB3111923);
  static const glassBorder = Color(0x33F5F8FC);

  // Light theme
  static const lightBackground = Color(0xFFF3F6FA);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightElevated = Color(0xFFE8EEF4);
  static const lightText = Color(0xFF0D141C);
  static const lightTextSecondary = Color(0xFF5A6B7C);
  static const lightBorder = Color(0xFFD3DCE5);
}
