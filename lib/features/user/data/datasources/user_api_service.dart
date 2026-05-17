import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:base_flutter_2/core/network/base_response.dart';

import '../models/user_model.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: "https://api.example.com")
@lazySingleton
abstract class UserApiService {
  @factoryMethod
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  // 1. Lấy thông tin profile user hiện tại (bọc trong BaseResponse)
  @GET("/user")
  Future<BaseResponse<UserModel>> getUser();

  // 2. Lấy thông tin user theo ID (bọc trong BaseResponse)
  @GET("/users/{id}")
  Future<BaseResponse<UserModel>> getUserById(@Path("id") String id);

  // 3. Lấy danh sách phân trang (bọc trong BaseResponse)
  @GET("/users")
  Future<BaseResponse<List<UserModel>>> getUsers(
    @Query("page") int page,
    @Query("limit") int limit,
  );

  // 4. Tạo mới user bằng JSON Body
  @POST("/users")
  Future<BaseResponse<UserModel>> createUser(@Body() Map<String, dynamic> body);

  // 5. Update user
  @PUT("/users/{id}")
  Future<BaseResponse<UserModel>> updateUser(
    @Path("id") String id,
    @Body() UserModel user,
  );
}
