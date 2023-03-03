import 'package:dio/dio.dart' as dio;
import 'package:themeal/data/repo.dart';


late Repo _repo;

class Request {
  late _Meals meals;

  Request() {
    _repo = Repo();
    meals = _Meals();
  }
}

class _Meals {
  Future<dio.Response> category() async {
    return _repo.meals.category();
  }
}