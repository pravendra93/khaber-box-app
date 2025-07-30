import 'package:flutter/material.dart';
import 'package:khaber_box/data/models/category_model.dart';
import 'package:khaber_box/data/services/api_services.dart';

class CategoryProvider with ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  List<CategoryModel> _categories = [];
  bool _isLoading = false;
  String? _error;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _categories = await _apiServices.getCategories();
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
