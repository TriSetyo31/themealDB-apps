const String _baseUrl = "https://www.themealdb.com/api/json/v1/1/";

class API {
  _Meals meals = _Meals();
  static const String baseUrl = _baseUrl;
}
class _Meals {
  final String category = "${_baseUrl}categories.php";
}