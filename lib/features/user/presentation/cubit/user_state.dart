import '../../domain/entities/user_entity.dart';

enum UserStatus { initial, loading, success, failure }

class UserState {
  const UserState({
    this.status = UserStatus.initial,
    this.user,
    this.errorMessage,
  });

  final UserStatus status;
  final UserEntity? user;
  final String? errorMessage;

  UserState copyWith({
    UserStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
