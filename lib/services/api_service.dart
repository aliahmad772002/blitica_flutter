import 'package:dio/dio.dart';

import '../model/user.dart';


class ApiService {
  final Dio _dio = Dio();

  Future<List<User>> fetchUsers({required int page, required int results}) async {
    final response = await _dio.get(
      'https://randomuser.me/api/',
      queryParameters: {
        "page": page,
        "results": results,
      },
    );

    if (response.statusCode == 200) {
      List data = response.data["results"];
      return data.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }
}
