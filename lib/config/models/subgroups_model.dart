
class SubGroupsModel {
  var data = <Data>[];
  SubGroupsModel();
  SubGroupsModel.fromJson({required List json}) {
    for (var element in json) {
      Data item = Data.fromJson(json: element);
      data.add(item);
    }
  }
}

class Data {
  int? id;
  int? quizId;
  String? name;
  String? photo;
  String? quiz;

  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    id = json['quizId'];
    name = json['name'];
    photo = json['image'];
    photo = json['quiz'];
  }
}