import 'package:flutter/material.dart';
import 'package:khaber_box/data/models/tags_model.dart';
import 'package:khaber_box/data/services/api_services.dart';

class TagsProvider extends ChangeNotifier {
  List<TagsModel> _tags = [];
  bool _isLoading = false;
  String? _error;

  List<TagsModel> get tags => _tags;
  bool get isLoading => _isLoading;
  String? get error => _error;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  Future<void> fetchTags() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _tags = await ApiServices().getTags();
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  void selectTag(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
