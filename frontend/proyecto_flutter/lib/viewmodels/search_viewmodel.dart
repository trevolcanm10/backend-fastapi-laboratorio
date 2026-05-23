import 'package:flutter/material.dart';
import '../repositories/persona_repository.dart';
import '../models/persona.dart';

class SearchViewModel extends ChangeNotifier {
  final repo = PersonaRepository();

  List<Persona> all = [];
  List<Persona> filtered = [];

  Future<void> load() async {
    all = await repo.getPersonas();
    filtered = all;
    notifyListeners();
  }

  void search(String text) {
    filtered = all.where((p) =>
        p.nombre.toLowerCase().contains(text.toLowerCase()) ||
        p.apellido.toLowerCase().contains(text.toLowerCase())
    ).toList();

    notifyListeners();
  }
}