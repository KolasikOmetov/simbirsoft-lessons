import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:simbirsoft_lessons/data/network/questions.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://opentdb.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api.php?amount=5&category=15&difficulty=easy&type=multiple")
  Future<Questions> getEasyQuestions();

  @GET("/api.php?amount=3&category=15&difficulty=medium&type=multiple")
  Future<Questions> getMediumQuestions();

  @GET("/api.php?amount=2&category=15&difficulty=hard&type=multiple")
  Future<Questions> getHardQuestions();
}
