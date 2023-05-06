//
// class PlaylistsModel {
//   PlaylistsModel();
//
//   PlaylistsModel.fromJson(Map<String,dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     autherName = json['autherName'];
//     photo = json['photo'];
//   }
//   int? id;
//   String? name;
//   String? autherName;
//   String? photo;
//
// }

/// status : true
/// data : [{"id":5,"name":"UI Designer","image":null,"job_time_type":"full","job_type":"remote","job_level":"entry","job_description":"Build User Engaging Interfaces","job_skill":"ui","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-12T12:02:22.000000Z","updated_at":"2023-03-12T12:02:22.000000Z"},{"id":4,"name":"UI Designer","image":null,"job_time_type":"part","job_type":"remote","job_level":"entry","job_description":"Build User Engaging Interfaces","job_skill":"ui","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-12T02:27:40.000000Z","updated_at":"2023-03-12T02:27:40.000000Z"},{"id":3,"name":"amit","image":null,"job_time_type":"part","job_type":"jsjgds","job_level":"entry","job_description":"dsjdhsdjhdjshddj","job_skill":"sdkhdskhdksh","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-12T02:21:26.000000Z","updated_at":"2023-03-12T02:21:26.000000Z"},{"id":2,"name":"flutter","image":null,"job_time_type":"part","job_type":"jsjgds","job_level":"entry","job_description":"dsjdhsdjhdjshddj","job_skill":"sdkhdskhdksh","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":0,"expired":0,"created_at":"2023-03-09T10:50:05.000000Z","updated_at":"2023-03-09T10:50:05.000000Z"},{"id":1,"name":"amit","image":null,"job_time_type":"part","job_type":"jsjgds","job_level":"entry","job_description":"dsjdhsdjhdjshddj","job_skill":"sdkhdskhdksh","comp_name":"amit","comp_email":"amit@gmail.com","comp_website":"amit.com","about_comp":"shdgshdgdshds","location":"hsjsdhsjhsjd","salary":"10k-16k","favorites":5,"expired":0,"created_at":"2023-03-09T10:42:37.000000Z","updated_at":"2023-03-12T12:04:40.000000Z"}]

class PlaylistsModel {
   var data = <Data>[];
  PlaylistsModel();
  PlaylistsModel.fromJson({required List json}) {
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
