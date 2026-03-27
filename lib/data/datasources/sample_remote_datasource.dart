import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Sample remote data source.
/// Fetches data from the remote API.
@injectable
class SampleRemoteDataSource {
  const SampleRemoteDataSource(this._dio);

  final Dio _dio;

  // TODO: Implement your API calls here.
  // Example:
  // Future<SampleModel> fetchSample() async {
  //   final response = await _dio.get('/sample');
  //   return SampleModel.fromJson(response.data);
  // }
}
