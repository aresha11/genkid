part of 'quizs_cubit.dart';

@immutable
abstract class QuizsState {}

class QuizsInitial extends QuizsState {}


/// Quiz
class LoadingQuizState extends QuizsState {}
class GetQuizSuccessState extends QuizsState {}
class GetQuizFilState extends QuizsState {}


/// Subgroups
class LoadingSubgroupsState extends QuizsState {}
class GetSubgroupsSuccessState extends QuizsState {}
class GetSubgroupsFilState extends QuizsState {}


/// Questions
class LoadingQuestionsState extends QuizsState {}
class GetQuestionsSuccessState extends QuizsState {}
class GetQuestionsFilState extends QuizsState {}
