
class QuestionsModel {
  var data = <Data>[];
  QuestionsModel();
  QuestionsModel.fromJson({required List json}) {
    for (var element in json) {
      Data item = Data.fromJson(json: element);
      data.add(item);
    }
  }
}

class Data {
  int? id;
  String? questione;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? correct;
  int? subgroupId;

  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    questione = json['questione'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    correct = json['correct'];
    subgroupId = json['subgroupId'];
  }
}