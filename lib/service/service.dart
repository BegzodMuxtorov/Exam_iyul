import 'package:dio/dio.dart';
import 'package:exam/model/model.dart';

class ExamService {
  Future getPhoto() async {
    try {
      Response response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        // print(response.data);
        return (response.data as List)
            .map((e) => ExamModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.message.toString();
    }
  }
}
