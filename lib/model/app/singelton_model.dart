import 'package:flutter/material.dart';
import 'package:themeal/model/category_model.dart';

class SingletonModel {
  static SingletonModel? _singleton;

  factory SingletonModel() => _singleton ?? SingletonModel._internal();

  SingletonModel._internal();

  static SingletonModel withContext(BuildContext context) {
    _singleton ??= SingletonModel._internal();
    _singleton!.context = context;

    return _singleton!;
  }

  static SingletonModel get shared => _singleton ?? SingletonModel._internal();

  CategoryModel? categoryModel;
  BuildContext? context;
}