import 'package:base_flutter_2/core/presentation/base_state.dart';

import '../../domain/entities/user_entity.dart';

class UserState extends BaseState {
  const UserState({super.status, super.errorMessage, this.user});

  final UserEntity? user;

  UserState copyWith({
    BaseStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [...super.props, user];
}
