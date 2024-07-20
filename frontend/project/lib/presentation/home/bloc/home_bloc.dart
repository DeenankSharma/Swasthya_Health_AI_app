import 'dart:async';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/presentation/home/models/articles_model.dart';
import 'package:project/presentation/home/models/recommendations_model.dart';
import 'dart:convert';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<RecommendationsInitialFetchEvent>(recommendationsInitialFetchEvent);
    on<ArticlesInitialFetchEvent>(articlesInitialFetchEvent);
  }

FutureOr<void> recommendationsInitialFetchEvent(RecommendationsInitialFetchEvent event, Emitter<HomeState> emit) async {
  try {
    var client = http.Client();
    print("hello ji");
    var response = await client.get(Uri.parse('https://swasthya-health-ai-backend.onrender.com'));
    print("OKKKKKKK");
    // print("this is" + response.body);
    if (response.statusCode == 200) { // Check for successful response
      final Map<String,dynamic> res = jsonDecode(response.body);
      print(res["videos"]);
      final List<dynamic> respy = res["videos"];
      final List<dynamic> respy3 = res["articles"];
      final List<RecommendationsModel> respy2 = [];
      final List<ArticlesModel> respy4 = [];
      for (int i=0;i<respy.length;i++){
        respy2.add(RecommendationsModel.fromJson(respy[i]));
      }
      for (int i=0;i<respy3.length;i++){
        respy4.add(ArticlesModel.fromJson(respy3[i]));
      }

          // .map((data) => RecommendationsModel.fromJson(data))
          // .toList();
      // print(respy[0]);
      // print(res);
      emit(RecommendationsInitialFetchSuccessState(items: respy2,items2:respy4));
    } else {
      print("Error fetching recommendations: ${response.statusCode}"); // Log error
    }
  } catch (error) {
    print("Error fetching recommendations: $error"); // Log error
  }
}

  FutureOr<void> articlesInitialFetchEvent(ArticlesInitialFetchEvent event, Emitter<HomeState> emit) async{

  }
}
