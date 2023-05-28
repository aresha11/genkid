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
  String? title;
  int? year;
  String? photo;
  int? rate;
  String? storeline;
  String? poster;
  String? videoURL;
  String? playlistName;
  int? playlistId;

  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    photo = json['photo'];
    rate = json['rate'];
    storeline = json['storeline'];
    poster = json['poster'];
    videoURL = json['videoURL'];
    playlistName = json['playlistName'];
    playlistId = json['playlistId'];
  }
}