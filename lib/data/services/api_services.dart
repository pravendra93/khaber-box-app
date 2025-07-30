import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:khaber_box/core/constants/api_endpoints.dart';
import 'package:khaber_box/data/models/category_model.dart';
import 'package:khaber_box/data/models/posts_model.dart';
import 'package:khaber_box/data/models/tags_model.dart';

class ApiServices {
  final http.Client client;

  ApiServices({http.Client? client}) : client = client ?? http.Client();

  Future<List<T>> _fetchList<T>(
    String url,
    T Function(Map<String, dynamic>) fromJson, {
    String? listKey,
  }) async {
    try {
      final response =
          await client.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        final dynamic jsonResponse = json.decode(response.body);

        List<dynamic> jsonList;

        if (listKey != null) {
          if (jsonResponse is Map<String, dynamic> &&
              jsonResponse[listKey] is List) {
            jsonList = jsonResponse[listKey];
          } else {
            throw Exception('Expected list for key "$listKey" not found.');
          }
        } else {
          if (jsonResponse is List) {
            jsonList = jsonResponse;
          } else {
            throw Exception(
                'Expected JSON array but found ${jsonResponse.runtimeType}');
          }
        }

        return jsonList.map((item) => fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // print(e);
      throw Exception('Error fetching data: $e');
    }
  }

  Future<List<CategoryModel>> getCategories() {
    return _fetchList<CategoryModel>(
      ApiEndpoints.categories,
      (json) => CategoryModel.fromJson(json),
    );
  }

  Future<List<TagsModel>> getTags() {
    return _fetchList<TagsModel>(
      ApiEndpoints.tags,
      (json) => TagsModel.fromJson(json),
    );
  }

  Future<List<PostsModel>> getPosts() {
    return _fetchList<PostsModel>(
      ApiEndpoints.posts,
      (json) => PostsModel.fromJson(json),
    );
  }
}
