part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class RecommendationsInitialFetchEvent extends HomeEvent{}

class ArticlesInitialFetchEvent extends HomeEvent{}