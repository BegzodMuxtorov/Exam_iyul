import 'dart:io';

import 'package:exam/model/model.dart';

import 'package:exam/service/service.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class PhotoDBService {
  Box<ExamModel>? PhotoBox;
  ExamService examService = ExamService();

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    PhotoBox = await Hive.openBox('photo');
     print(PhotoBox!.length);
  }

  Future<void> writeDB(List<ExamModel> model) async {
    await openBox();
    await PhotoBox!.clear();
    await PhotoBox!.addAll(model);
   
  }

  Future<dynamic> getDBphoto() async {
    dynamic response = await examService.getPhoto();
    if (response is List<ExamModel>) {
      await openBox();
      await writeDB(response);
      return PhotoBox!.values.toList();
    } else {
      return response;
    }
  }

  static void registeradapter() {
    Hive.registerAdapter(ExamModelAdapter());
    // g.dart filedagi adapter qanday chaqirilgan bolsa
    //(registerAdapterni) ichiga xam shu narsa chaqiriladi
  }

  Future<dynamic> checkBox() async {
    await openBox();
    if (PhotoBox!.isNotEmpty) {
      return PhotoBox!.values.toList();
    } else {
      return getDBphoto();
    }
  }
}
