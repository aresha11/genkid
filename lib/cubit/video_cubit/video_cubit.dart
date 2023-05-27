import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../config/data/shared/dio_helper.dart';
import '../../config/models/video_model.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());



  DioHelper dioHelper=DioHelper();

  VideoModel videoModel=VideoModel();

  List<VideoModel> data=[];


  void  getAllVideo()async {
    //data.clear();
    emit(LoadingDataState());
    await dioHelper.getData(
      url: "http://osama121220-001-site1.btempurl.com/api/Playlists",
    ).then((value) {
      if (value.statusCode == 200) {
        emit(GetDataSuccessState());
        videoModel = VideoModel.fromJson(json: value.data);
        print(videoModel.data.length);

      }
    }).catchError((error) {
      emit(GetDataFilState());
      throw error;
    });
  }



}
class VideosModel {
  var data = <Data>[];
  VideosModel();
  VideosModel.fromJson({required List json}) {
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