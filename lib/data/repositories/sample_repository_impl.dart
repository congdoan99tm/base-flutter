import 'package:injectable/injectable.dart';

/// Sample repository implementation.
/// Bridges the data sources and the domain layer.
@Injectable()
class SampleRepositoryImpl {
  const SampleRepositoryImpl();

  // TODO: Inject data sources and implement domain repository interface.
  // Example:
  // final SampleRemoteDataSource _remoteDataSource;
  //
  // @override
  // Future<Either<Failure, SampleEntity>> getSample(int id) async { ... }
}
