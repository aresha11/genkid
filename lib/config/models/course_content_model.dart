


class CourseContentModel {
  var data = <Data>[];
  CourseContentModel();
  CourseContentModel.fromJson({required List json}) {
    for (var element in json) {
      Data item = Data.fromJson(json: element);
      data.add(item);
    }
  }
}

class Data {
  int? id;
  String? playlistName;
  String? video;
  String? title;
  String? autherName;


  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    title = json['title'];
    playlistName = json['playlistName'];
    autherName = json['autherName'];
    video = json['videoURL'];
  }
}
