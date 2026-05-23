import 'package:proyecto_flutter/services/api_service.dart';
import 'package:proyecto_flutter/models/persona.dart';

class SearchRepository {
  final ApiService _apiService = ApiService();

  Future<List<Persona>> buscarPersonas() async {
    try {
      final data = await _apiService.get('/personas');
      return data.map((json) => Persona.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }
}