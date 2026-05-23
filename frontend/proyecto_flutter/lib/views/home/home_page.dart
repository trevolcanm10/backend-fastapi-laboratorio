import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/search_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<SearchViewModel>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SearchViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Personas")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar por nombre o apellido',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => vm.search(value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vm.filtered.length,
              itemBuilder: (context, index) {
                final p = vm.filtered[index];
                return ListTile(
                  title: Text("${p.nombre} ${p.apellido}"),
                  subtitle: Text("Código: ${p.codigo} | ${p.sexo} | ${p.estadoCivil}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}