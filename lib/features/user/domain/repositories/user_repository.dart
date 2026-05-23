import 'package:base_flutter_2/core/error/failures.dart';
import 'package:base_flutter_2/core/result/result.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Result<UserEntity, Failure>> getUser();
}
