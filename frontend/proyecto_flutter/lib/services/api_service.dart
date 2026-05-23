import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

class ApiService {
  // URLs por orden de prioridad
  static const List<String> _urls = [
    "https://backend-fastapi-laboratorio.onrender.com",  // Render (desplegado)
    "http://10.0.2.2:8000",                               // Android emulator -> localhost
    "http://localhost:8000",                               // PC local
  ];

  static const Duration _timeout = Duration(seconds: 30);

  Future<List<dynamic>> _getWithRetry(String endpoint, {int retries = 2}) async {
    for (final baseUrl in _urls) {
      for (int attempt = 0; attempt <= retries; attempt++) {
        try {
          final response = await http
              .get(Uri.parse('$baseUrl$endpoint'))
              .timeout(_timeout);

          if (response.statusCode == 200) {
            return json.decode(response.body);
          }
        } catch (e) {
          print('Fallo con $baseUrl: $e');
          if (attempt == retries) {
            break; // Pasar a la siguiente URL
          }
          await Future.delayed(const Duration(seconds: 1));
        }
      }
    }
    throw Exception("No se pudo conectar a ninguna URL");
  }

  Future<List<dynamic>> getUsuarios() async {
    return _getWithRetry('/usuarios');
  }

  Future<List<dynamic>> getPersonas() async {
    return _getWithRetry('/personas');
  }
}