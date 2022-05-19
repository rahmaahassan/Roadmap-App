import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:road_map_project/infrastructure/remote/caegories/i_category.dart';

import '../../../domain/category_model.dart';


class FirebaseCategoriesFacade implements ICategoryFacade {

  @override
  Future<Either<String, List<CategoryModel>>> get getAllCategories async{
    List<CategoryModel> data = List.empty(growable: true);

    try {
      final ByteData jsonData = await rootBundle.load("assets/data.json");
      final String jsonString = utf8.decode(jsonData.buffer.asUint8List());
      final List body = json.decode(jsonString);
      data.addAll(body.map((test) {
        return CategoryModel.fromJson(test);
      }));
      return right(data);
    } catch (e){
      print(e.toString());
      return left(e.toString());
    }
  }

}