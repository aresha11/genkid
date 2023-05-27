part of 'video_cubit.dart';

@immutable
abstract class VideoState {}

class VideoInitial extends VideoState {}
class LoadingDataState extends VideoState {}
class GetDataSuccessState extends VideoState {}
class GetDataFilState extends VideoState {}
