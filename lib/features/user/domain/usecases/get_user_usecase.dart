import 'package:injectable/injectable.dart';
import 'package:base_flutter_2/core/utils/result.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

@injectable
class GetUserUseCase {
  GetUserUseCase(this._userRepository);

  final UserRepository _userRepository;

  Future<Result<UserEntity>> call() async {
    return _userRepository.getUser();
  }
}
