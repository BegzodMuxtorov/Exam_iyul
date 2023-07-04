import 'package:exam/db/db_service.dart';
import 'package:exam/model/model.dart';
import 'package:flutter/material.dart';

class PopularProvider extends ChangeNotifier {
  PhotoDBService photoDBService = PhotoDBService();
  PopularProvider() {
    getPhoto();
  }

  bool isLoading = false;
  String error = '';
  List<ExamModel> data = [];

  Future<void> getPhoto() async {
    isLoading = true;
    notifyListeners();
    dynamic response = await photoDBService.checkBox();
    if (response is List<ExamModel>) {
      isLoading = false;
      data = response;
      notifyListeners();
    } else if (response is String) {
      isLoading = false;
      error = response;
      notifyListeners();
    } else {
      isLoading = false;
      error = 'An unknown error occurred.';
      notifyListeners();
    }
  }
}
