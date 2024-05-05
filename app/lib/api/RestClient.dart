// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:prime_ai_flutter_ui_kit/api/entities/UserEntity.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET("/login")
  Future<void> login(@Query("email") String email, @Query("password") String password);
  @GET("/info")
  Future<UserEntity> infoUser(@Query("email") String email);
  @POST("/register")
  Future<String> register(@Query("email") String email, @Query("password") String password);
  @POST("/activateUser")
  Future<void> activateAccount(@Query("email") String email);
  @POST("/sendInfo")
  Future<void> sendInfo(@Query("email") String email, @Query("name") String name, @Query("phone_code") String phone_code, @Query("phone") String phone, @Query("gender") String gender, @Query("date_of_birth") DateTime dateOfBirth, @Part(name: "file") File? file);
}
