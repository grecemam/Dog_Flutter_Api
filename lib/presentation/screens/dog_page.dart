import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../bloc/dog_cubit.dart';
import '../bloc/dog_state.dart';
import 'dog_detail_page.dart';

class DogPage extends StatelessWidget {
  const DogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Породы собак', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.brown[700],
      ),
      body: BlocBuilder<DogCubit, DogState>(
        builder: (context, state) {
          if (state is DogLoading) {
            return _buildLoadingList();
          } else if (state is DogLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.dogs.length,
              itemBuilder: (context, index) {
                final dog = state.dogs[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite_border, color: Colors.red),
                      onPressed: () {
                        // context.read<DogCubit>().addToFavorites(dog.referenceImageId);
                      },
                    ),
                    leading: Image.network(
                      "https://cdn2.thedogapi.com/images/${dog.referenceImageId}.jpg",
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          "https://cdn2.thedogapi.com/images/${dog.referenceImageId}.png",
                          errorBuilder: (_, __, ___) => const Icon(Icons.pets, size: 50), // Фолбэк
                        );
                      },
                    ),
                    title: Text(
                      dog.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      dog.breedGroup,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    onTap: () {
                      // Переход на экран с подробной информацией
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DogDetailPage(dog: dog),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is DogError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
            );
          }
          return const Center(child: Text('Все плохо :(', style: TextStyle(fontSize: 18)));
        },
      ),
    );
  }

  /// Заглушка-загрузка с эффектом Shimmer
  Widget _buildLoadingList() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              title: Container(
                height: 15,
                width: 100,
                color: Colors.white,
              ),
              subtitle: Container(
                height: 12,
                width: 150,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}