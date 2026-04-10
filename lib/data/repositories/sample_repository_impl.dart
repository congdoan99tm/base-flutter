import 'package:injectable/injectable.dart';

/// Sample repository implementation.
/// Bridges the data sources and the domain layer.
@Injectable()
class SampleRepositoryImpl {
  const SampleRepositoryImpl();

  // Example:
  // final SampleRemoteDataSource _remoteDataSource;
  //
  // @override
  // Future<Either<Failure, SampleEntity>> getSample(int id) async { ... }
}
