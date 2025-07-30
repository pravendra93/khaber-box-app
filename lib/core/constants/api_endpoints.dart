const String kBaseUrl = "https://khaberbox.com/wp-json/wp/v2/";

class ApiEndpoints {
  static const String categories = "${kBaseUrl}categories";
  static const String posts = "${kBaseUrl}posts";
  static const String users = "${kBaseUrl}users";
  static const String tags = "${kBaseUrl}tags";
  static const String media = "${kBaseUrl}media";


  static String singleCategory(int id) => "${kBaseUrl}categories/$id";
  static String postsByCategory(int catId) =>
      "${kBaseUrl}posts?categories=$catId";
  static String userDetails(int userId) => "${kBaseUrl}users/$userId";
}
