import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'cubit/{{name}}_cubit.dart';
import 'cubit/{{name}}_state.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<{{name.pascalCase()}}Cubit>()..fetch{{name.pascalCase()}}(),
      child: const {{name.pascalCase()}}View(),
    );
  }
}

class {{name.pascalCase()}}View extends StatelessWidget {
  const {{name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{name.pascalCase()}}'),
      ),
      body: BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
        builder: (context, state) {
          return switch (state.status) {
            {{name.pascalCase()}}Status.initial || {{name.pascalCase()}}Status.loading =>
              const Center(child: CircularProgressIndicator()),
            {{name.pascalCase()}}Status.failure =>
              Center(child: Text(state.errorMessage ?? 'Error')),
            {{name.pascalCase()}}Status.success =>
              Center(child: Text('Success: ${state.{{name.camelCase()}}?.id}')),
          };
        },
      ),
    );
  }
}
