import 'package:flutter/material.dart';
import '../repositories/persona_repository.dart';
import '../models/persona.dart';

class PersonaViewModel extends ChangeNotifier {
  final PersonaRepository repository = PersonaRepository();

  List<Persona> personas = [];
  bool isLoading = false;

  Future<void> cargarPersonas() async {
    isLoading = true;
    notifyListeners();

    try {
      personas = await repository.getPersonas();
    } catch (e) {
      print("Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}