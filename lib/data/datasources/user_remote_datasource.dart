import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserRemoteDataSource {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<UserModel> getUser(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Kullanıcı getirilemedi.');
    }
  }
}
