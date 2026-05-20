import 'package:injectable/injectable.dart';
import 'package:base_flutter_2/core/utils/result.dart';
import 'package:base_flutter_2/core/repositories/base_repository.dart';
import '../datasources/news_api_service.dart';
import '../models/news_model.dart';

@lazySingleton
class NewsRepository extends BaseRepository {
  NewsRepository(this._apiService);

  final NewsApiService _apiService;

  Future<Result<NewsModel>> getNews() async {
    return safeCall(() async {
      final response = await _apiService.getNews();
      return response.data;
    });
  }
}
