import '../services/api_service.dart';

class AuthRepository {
  final ApiService api = ApiService();

  Future<bool> login(String email, String password) async {
    final users = await api.getUsuarios();

    return users.any((u) =>
        u['email'] == email && u['password'] == password);
  }
}