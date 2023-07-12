class PostsModel {
  var data = <Data>[];
  PostsModel();
  PostsModel.fromJson({required List json}) {
    for (var element in json) {
      Data item = Data.fromJson(json: element);
      data.add(item);
    }
  }
}

class Data {
  int? id;
  String? userName;
  String? post;


  Data.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    userName = json['userName'];
    post = json['post'];

  }
}