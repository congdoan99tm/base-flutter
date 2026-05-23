import 'package:injectable/injectable.dart';
import 'package:base_flutter_2/core/error/failures.dart';
import 'package:base_flutter_2/core/result/result.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

@injectable
class GetUserUseCase {
  GetUserUseCase(this._userRepository);

  final UserRepository _userRepository;

  Future<Result<UserEntity, Failure>> call() async {
    return _userRepository.getUser();
  }
}
