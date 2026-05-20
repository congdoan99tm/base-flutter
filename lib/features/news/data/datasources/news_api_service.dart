import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:base_flutter_2/core/network/base_response.dart';

import '../models/news_model.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: "https://api.example.com")
@lazySingleton
abstract class NewsApiService {
  @factoryMethod
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET("/news")
  Future<BaseResponse<NewsModel>> getNews();
}
