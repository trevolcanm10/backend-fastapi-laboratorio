import 'package:proyecto_flutter/services/api_service.dart';

class LoginRepository {
  final ApiService _apiService = ApiService();

  Future<bool> login(String email, String password) async {
    try {
      final usuarios = await _apiService.get('/usuarios');
      for (final usuario in usuarios) {
        if (usuario['email'] == email && usuario['password'] == password) {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}