import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/category.dart';

class CategoryRepository {
  List<Category>? _cachedCategories;

  /// 모든 카테고리 로드
  Future<List<Category>> getCategories() async {
    if (_cachedCategories != null) {
      return _cachedCategories!;
    }

    final jsonString = await rootBundle.loadString(
      'assets/data/categories.json',
    );
    final jsonData = json.decode(jsonString) as Map<String, dynamic>;
    final categoriesJson = jsonData['categories'] as List<dynamic>;

    _cachedCategories = categoriesJson
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => a.order.compareTo(b.order));

    return _cachedCategories!;
  }

  /// 특정 카테고리 조회
  Future<Category?> getCategoryById(String id) async {
    final categories = await getCategories();
    try {
      return categories.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  /// 캐시 초기화
  void clearCache() {
    _cachedCategories = null;
  }
}
