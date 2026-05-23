import 'package:flutter_bloc/flutter_bloc.dart';

import '../error/failures.dart';
import '../result/result.dart';
import 'base_state.dart';

abstract class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(super.initialState);

  void safeEmit(S state) {
    if (!isClosed) {
      emit(state);
    }
  }

  Future<void> handleResult<T>({
    required Future<Result<T, Failure>> Function() action,
    required S Function(S state) onLoading,
    required S Function(S state, T data) onSuccess,
    required S Function(S state, String message) onFailure,
  }) async {
    safeEmit(onLoading(state));

    final result = await action();

    switch (result) {
      case Success<T, Failure>(data: final data):
        safeEmit(onSuccess(state, data));
      case Error<T, Failure>(error: final failure):
        safeEmit(onFailure(state, failure.message));
    }
  }
}
