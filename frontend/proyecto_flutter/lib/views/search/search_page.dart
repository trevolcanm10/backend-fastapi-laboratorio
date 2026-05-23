import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/viewmodels/search_viewmodel.dart';
import 'package:proyecto_flutter/viewmodels/login_viewmodel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchViewModel>().cargarPersonas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Personas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<LoginViewModel>().logout();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<SearchViewModel>(
              builder: (context, viewModel, _) {
                return TextField(
                  decoration: const InputDecoration(
                    labelText: 'Buscar por nombre o apellido',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: viewModel.setSearchQuery,
                );
              },
            ),
          ),
          Expanded(
            child: Consumer<SearchViewModel>(
              builder: (context, viewModel, _) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (viewModel.errorMessage != null) {
                  return Center(
                    child: Text(
                      viewModel.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (viewModel.personas.isEmpty) {
                  return const Center(child: Text('No se encontraron personas'));
                }

                return ListView.builder(
                  itemCount: viewModel.personas.length,
                  itemBuilder: (context, index) {
                    final persona = viewModel.personas[index];
                    return Card(
                      child: ListTile(
                        title: Text('${persona.nombre} ${persona.apellido}'),
                        subtitle: Text(
                          'Código: ${persona.codigo} | Sexo: ${persona.sexo} | Estado civil: ${persona.estadoCivil}',
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}