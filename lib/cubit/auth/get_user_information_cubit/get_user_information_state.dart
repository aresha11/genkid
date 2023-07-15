part of 'get_user_information_cubit.dart';

@immutable
abstract class GetUserInformationState {}

class GetUserInformationInitial extends GetUserInformationState {}
class LoadingUserInfoState extends GetUserInformationState {}
class GetDataSuccessState extends GetUserInformationState {

}
class GetDataErrorState extends GetUserInformationState {}
