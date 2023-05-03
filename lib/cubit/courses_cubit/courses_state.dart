part of 'courses_cubit.dart';

@immutable
abstract class CoursesState {}

class CoursesInitial extends CoursesState {}
class LoadingDataState extends CoursesState {}
class GetDataSuccessState extends CoursesState {}
class GetDataErrorState extends CoursesState {}
