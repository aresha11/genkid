part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}
class LoadingAddPostState extends PostsState {}
class AddPostSuccessState extends PostsState {}
class AddPostFailedState extends PostsState {}


class LoadingGetPostState extends PostsState {}
class GetPostSuccessState extends PostsState {}
class GetPostFailedState extends PostsState {}
