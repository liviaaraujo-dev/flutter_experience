import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/core/env.dart';
import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.restClient});

  final RestClient restClient;

  @override
  Future<Either<AuthException, String>> login(String email, String password) async{
    try{
      final Response(data: {'access_token': accessToken}) =  await restClient.unAuth.post('http://192.168.143.21:3306/auth', data: {
        'email': email,
        'password': password,
        'admin': true
      });

      return Right(accessToken);
      
    }on DioException catch(e, s){
      log('Error ao realizar login', error: e, stackTrace: s);
      return switch(e){
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) => Left(AuthUnauthorizedException()),
        _ => Left(AuthError( message: 'Erro ao realizar login'))
      };
    }
  }

}
