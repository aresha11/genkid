part of 'courses_cubit.dart';

@immutable
abstract class CoursesState {}

class CoursesInitial extends CoursesState {}
class LoadingCoursesState extends CoursesState {}
class LoadingCoursesByIdState extends CoursesState {}
class GetDataSuccessState extends CoursesState {}
class GetDataErrorState extends CoursesState {}
