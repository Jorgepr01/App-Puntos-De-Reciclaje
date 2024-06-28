import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:puntos_reciclaje/data/direccion.dart';
import 'package:puntos_reciclaje/data/direccion_data.dart';
import 'package:puntos_reciclaje/widgets/veggie_headline.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  List<Veggie> get favoriteVeggies =>
      veggies.where((v) => v.isFavorite).toList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteVeggies.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Aún no has agregado ubicacion favorita o cercana a tu recidencia.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : ListView(
              children: [
                const SizedBox(height: 24),
                for (Veggie veggie in favoriteVeggies)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    child: VeggieHeadline(veggie),
                  ),
              ],
            ),
    );
  }
}
