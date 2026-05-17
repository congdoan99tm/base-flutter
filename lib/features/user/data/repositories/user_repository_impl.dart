import 'package:injectable/injectable.dart';
import 'package:base_flutter_2/core/utils/result.dart';
import 'package:base_flutter_2/core/repositories/base_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_api_service.dart';
import '../mappers/user_mapper.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends BaseRepository implements UserRepository {
  UserRepositoryImpl(this._apiService);

  final UserApiService _apiService;

  @override
  Future<Result<UserEntity>> getUser() async {
    return safeCall(() async {
      final response = await _apiService.getUser();
      final model = response.data; // Tự động lấy UserModel từ key "data" nhờ BaseResponse
      return UserMapper.toEntity(model);
    });
  }
}
