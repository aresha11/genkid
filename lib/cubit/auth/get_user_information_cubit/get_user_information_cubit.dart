import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:genkid/config/models/user_information_model.dart';
import 'package:meta/meta.dart';

import '../../../config/data/local/shared_preference.dart';
import '../../../config/data/shared/dio_helper.dart';

part 'get_user_information_state.dart';

class GetUserInformationCubit extends Cubit<GetUserInformationState> {
  GetUserInformationCubit() : super(GetUserInformationInitial());


  DioHelper dioHelper=DioHelper();
  UserInformationModel userInformationModel=UserInformationModel();

  void  getUserInformation()async {
    emit(LoadingUserInfoState());
    await dioHelper.getData(
      url:"http://aresha11-001-site1.ftempurl.com/api/Auth/GetUserInfo",
      token: SharedPreference.get(key: "token")
    ).then((value) {
      if (value.statusCode ==200) {
        emit(GetDataSuccessState());
        userInformationModel= UserInformationModel.fromJson(value.data[0]);
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(GetDataErrorState());
    });
  }



}
