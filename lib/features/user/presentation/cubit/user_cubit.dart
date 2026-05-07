import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:base_flutter_2/core/utils/result.dart';
import '../../domain/usecases/get_user_usecase.dart';
import 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  UserCubit(this._getUserUseCase) : super(const UserState());

  final GetUserUseCase _getUserUseCase;

  Future<void> fetchUser() async {
    emit(state.copyWith(status: UserStatus.loading));

    final result = await _getUserUseCase();

    final newState = switch (result) {
      Success(data: final user) => state.copyWith(
          status: UserStatus.success,
          user: user,
        ),
      Error(failure: final failure) => state.copyWith(
          status: UserStatus.failure,
          errorMessage: failure.message,
        ),
    };

    emit(newState);
  }
}
