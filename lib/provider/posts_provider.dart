import 'package:flutter/material.dart';
import 'package:khaber_box/data/models/posts_model.dart';
import 'package:khaber_box/data/services/api_services.dart';

class PostsProvider with ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  List<PostsModel> _posts = [];
  bool _isLoading = false;
  String? _error;

  List<PostsModel> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _posts = await _apiServices.getPosts();
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
