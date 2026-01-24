import 'package:flutter/material.dart';

class AppColors {
  // Brand colors - Light Bulb Theme (Yellow/Amber)
  static const Color primary = Color(0xFFFFC107);        // Amber - 메인 전구 색상
  static const Color primaryDark = Color(0xFFFFA000);    // Amber Dark
  static const Color primaryLight = Color(0xFFFFD54F);   // Amber Light
  static const Color secondary = Color(0xFF5D4037);      // Brown - 전구 소켓 색상
  static const Color secondaryLight = Color(0xFF8D6E63); // Brown Light
  static const Color accent = Color(0xFFFF6F00);         // Orange Accent - 따뜻한 빛

  // Surface colors
  static const Color surfaceLight = Color(0xFFFFFBF5);   // 따뜻한 화이트
  static const Color surfaceDark = Color(0xFF1A1A1A);    // 다크 그레이

  // On colors (for contrast)
  static const Color onPrimary = Color(0xFF1A1A1A);      // 노란색 위의 텍스트
  static const Color onSecondary = Color(0xFFFFFFFF);    // 브라운 위의 텍스트

  // Category colors
  static const Color geography = Color(0xFF2E7D32);
  static const Color history = Color(0xFF8B4513);
  static const Color science = Color(0xFF1565C0);
  static const Color arts = Color(0xFF7B1FA2);
  static const Color sports = Color(0xFFC62828);
  static const Color nature = Color(0xFF388E3C);
  static const Color technology = Color(0xFF0277BD);
  static const Color food = Color(0xFFEF6C00);

  // Quiz feedback colors
  static const Color correct = Color(0xFF4CAF50);
  static const Color wrong = Color(0xFFF44336);

  // Get color by category ID
  static Color getCategoryColor(String categoryId) {
    switch (categoryId) {
      case 'geography':
        return geography;
      case 'history':
        return history;
      case 'science':
        return science;
      case 'arts':
        return arts;
      case 'sports':
        return sports;
      case 'nature':
        return nature;
      case 'technology':
        return technology;
      case 'food':
        return food;
      default:
        return primary;
    }
  }
}
