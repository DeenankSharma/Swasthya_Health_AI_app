part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class HomeActionState extends HomeState{}
class RecommendationsInitialFetchSuccessState extends HomeState{
  final List<RecommendationsModel> items;
  final List<ArticlesModel> items2;
  RecommendationsInitialFetchSuccessState({
    required this.items,
    required this.items2
  });
}