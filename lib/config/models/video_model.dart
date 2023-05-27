class VideoModel {
  var data = <Data>[];
  VideoModel();
  VideoModel.fromJson({required List json}) {
    for (var element in json) {
      Data item = Data.fromJson(json: element);
      data.add(item);
    }
  }
}

class Data {
  int? id;
  String? name;
  String? autherName;
  String? photo;

  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'];
    autherName = json['autherName'];
    photo = json['photo'];
  }
}