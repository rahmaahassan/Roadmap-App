import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:road_map_project/infrastructure/remote/caegories/i_category.dart';

import '../../../domain/category_model.dart';


class FirebaseCategoriesFacade implements ICategoryFacade {

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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

  @override
  Future<Either<String, bool>> uploadCategories() async {
    List<CategoryModel> categories = await getCategoriesJson;

    try {
      final CollectionReference categoriesCollection =  _firebaseFirestore.collection('categories');
      for (CategoryModel category in categories){
        await categoriesCollection
            .doc(category.id.toString())
            .set(category.toJson());
      }
      return right(true);
    } catch(e){
      return left(e.toString());
    }
  }

  Future<List<CategoryModel>> get getCategoriesJson async{
    List<CategoryModel> data = List.empty(growable: true);

    try {
      final ByteData jsonData = await rootBundle.load("assets/data.json");
      final String jsonString = utf8.decode(jsonData.buffer.asUint8List());
      final List body = json.decode(jsonString);
      data.addAll(body.map((doctor) {
        return CategoryModel.fromJson(doctor);
      }));
      return data;
    } catch (e){
      print(e.toString());
      return List.empty(growable: true);
    }
  }

  @override
  Future<Either<String, List<CategoryModel>>> get getCategoriesFirebase async{
    List<CategoryModel>? categories = List.empty(growable: true);
    try {

      QuerySnapshot querySnapshot = await _firebaseFirestore.collection('categories').get();

      // Get data from docs and convert map to List
      final List<Map<String, dynamic>> allData = querySnapshot.docs.map(
              (doc) => doc.data() as Map<String, dynamic>
      ).toList();

      categories.addAll(
          allData.map(
                  (category) => CategoryModel.fromJson(category)
          )
      );

      categories.sort((a, b) {
        bool comp = a.courses.length < b.courses.length;
        return comp == true ? 1 : 0;
      });

      return right(categories);
    }catch(e){
      print('Err ${e.toString()}');
      return left(e.toString());
    }
  }
}