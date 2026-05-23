import '../services/api_service.dart';
import '../models/persona.dart';

class PersonaRepository {
  final ApiService apiService = ApiService();

  Future<List<Persona>> getPersonas() async {
    final data = await apiService.getPersonas();

    return data.map<Persona>((json) {
      return Persona.fromJson(json);
    }).toList();
  }
}