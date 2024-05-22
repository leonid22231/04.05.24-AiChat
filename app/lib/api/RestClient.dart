// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:prime_ai_flutter_ui_kit/api/entities/ChatEntity.dart';
import 'package:prime_ai_flutter_ui_kit/api/entities/UserEntity.dart';
import 'package:prime_ai_flutter_ui_kit/api/enums/ChatModel.dart';
import 'package:prime_ai_flutter_ui_kit/api/enums/ChatTheme.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET("/login")
  Future<void> login(
      @Query("uid") String uid, @Query("languageCode") String languageCode);
  @GET("/chat/{theme}")
  Future<ChatEntity> findChat(
      @Path("theme") ChatTheme theme, @Query("uid") String uid);
  @DELETE("/chat/{theme}/delete")
  Future<void> deleteChat(
      @Path("theme") ChatTheme theme, @Query("uid") String uid);
  @POST("/chat/{theme}/model")
  Future<void> changeModel(@Path("theme") ChatTheme theme,
      @Query("uid") String uid, @Query("model") ChatModel model);
}
