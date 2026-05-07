import 'package:base_flutter_2/core/utils/result.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Result<UserEntity>> getUser();
}
