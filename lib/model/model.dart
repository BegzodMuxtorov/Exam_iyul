import 'package:hive/hive.dart';

part 'model.g.dart';

// bu part asosiy model qaysi papkada turgan bolsa
// shu papkani nomini yoziladi model nomini emas 
//
//

@HiveType(typeId: 0)
class ExamModel {

  @HiveField(0)
  int? userId;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? body;

  ExamModel({this.userId, this.id, this.title, this.body});

  ExamModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
