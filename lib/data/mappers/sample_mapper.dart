/// A mapper converts a data-layer model to a domain-layer entity and vice versa.
///
/// Example:
/// ```dart
/// class UserMapper {
///   UserEntity toEntity(UserModel model) {
///     return UserEntity(id: model.id, name: model.name);
///   }
///
///   UserModel toModel(UserEntity entity) {
///     return UserModel(id: entity.id, name: entity.name);
///   }
/// }
/// ```

// TODO: Create your mapper classes here, one per data model.
