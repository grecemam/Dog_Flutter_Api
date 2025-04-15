import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/dog_page.dart';
import 'core/di/service_locator.dart';
import 'presentation/bloc/dog_cubit.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DogCubit>(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DogPage(),
      ),
    );
  }
}