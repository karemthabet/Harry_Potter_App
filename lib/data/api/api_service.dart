import 'package:breaking_bad_api/data/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static late SharedPreferences pref;

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
    token = pref.getString('token') ?? '';
  }

  static final Dio _dio = Dio();
  static const String baseUrl = 'https://hp-api.onrender.com/api/';
  static String token = '';

  static Future<Either<Failure, List<dynamic>>> get({required String endPoint}) async {
    try {
      var response = await _dio.get(
        '$baseUrl$endPoint',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.data is List) {
        return right(response.data as List<dynamic>);
      } else {
        return left(ServerFailure(errMessage: 'Invalid data format'));
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(
          errMessage: 'Oops, there is an error. Please try again'));
    }
  }
}