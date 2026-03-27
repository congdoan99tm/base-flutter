/// A use case encapsulates a single application business action.
///
/// Example:
/// ```dart
/// import 'package:dartz/dartz.dart';
/// import 'package:injectable/injectable.dart';
///
/// @injectable
/// class GetSampleUseCase {
///   const GetSampleUseCase(this._repository);
///   final SampleRepository _repository;
///
///   Future<Either<Failure, SampleEntity>> call(int id) {
///     return _repository.getSample(id);
///   }
/// }
/// ```

// TODO: Add your use-case classes here, one per file.
