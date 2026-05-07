import 'package:injectable/injectable.dart';
import 'package:base_flutter_2/core/utils/result.dart';
import 'package:base_flutter_2/core/repositories/base_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../mappers/user_mapper.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends BaseRepository implements UserRepository {
  UserRepositoryImpl(this._remoteDataSource);

  final UserRemoteDataSource _remoteDataSource;

  @override
  Future<Result<UserEntity>> getUser() async {
    return safeCall(() async {
      final model = await _remoteDataSource.getUser();
      return UserMapper.toEntity(model);
    });
  }
}
