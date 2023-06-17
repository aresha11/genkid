
class QuizModel {
  var data = <Data>[];
  QuizModel();
  QuizModel.fromJson({required List json}) {
    for (var element in json) {
      Data item = Data.fromJson(json: element);
      data.add(item);
    }
  }
}

class Data {
  int? id;
  String? autherName;
  String? photo;

  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    autherName = json['autherName'];
    photo = json['picture'];
  }
}
