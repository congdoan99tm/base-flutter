import 'package:injectable/injectable.dart';

/// Sample remote data source.
/// Fetches data from the remote API.
@injectable
class SampleRemoteDataSource {
  const SampleRemoteDataSource();

  // Example:
  // Future<SampleModel> fetchSample() async {
  //   final response = await _dio.get('/sample');
  //   return SampleModel.fromJson(response.data);
  // }
}
