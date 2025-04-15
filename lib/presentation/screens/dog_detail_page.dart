import 'package:flutter/material.dart';

class DogDetailPage extends StatelessWidget {
  final dog;

  const DogDetailPage({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
        backgroundColor: Colors.brown[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              "https://cdn2.thedogapi.com/images/${dog.referenceImageId}.jpg",
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  "https://cdn2.thedogapi.com/images/${dog.referenceImageId}.png",
                  errorBuilder: (_, __, ___) => const Icon(Icons.pets, size: 100), // Фолбэк
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Название: ${dog.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Группа: ${dog.breedGroup ?? 'Неизвестно'}'),
            Text('Описание: ${dog.bredFor ?? 'Отсутствует'}'),
            Text('Страна происхождения: ${dog.countryCode ?? 'Неизвестно'}'),
            Text('Продолжительность жизни: ${dog.lifeSpan ?? 'Неизвестно'}'),
            Text('Вес: ${dog.weight.metric ?? 'Неизвестно'} кг'),
            Text('Высота: ${dog.height.metric ?? 'Неизвестно'} см'),
            Text('Темперамент: ${dog.temperament ?? 'Неизвестно'}'),
          ],
        ),
      ),
    );
  }
}