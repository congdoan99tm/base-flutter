import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:base_flutter_2/core/utils/result.dart';
import '../../domain/usecases/get_{{name.snakeCase()}}_usecase.dart';
import '{{name}}_state.dart';

@injectable
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(this._get{{name.pascalCase()}}UseCase) : super(const {{name.pascalCase()}}State());

  final Get{{name.pascalCase()}}UseCase _get{{name.pascalCase()}}UseCase;

  Future<void> fetch{{name.pascalCase()}}() async {
    emit(state.copyWith(status: {{name.pascalCase()}}Status.loading));

    final result = await _get{{name.pascalCase()}}UseCase();

    final newState = switch (result) {
      Success(data: final data) => state.copyWith(
          status: {{name.pascalCase()}}Status.success,
          {{name.camelCase()}}: data,
        ),
      Error(failure: final failure) => state.copyWith(
          status: {{name.pascalCase()}}Status.failure,
          errorMessage: failure.message,
        ),
    };

    emit(newState);
  }
}
