import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/places_details.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text("No places added yet"),
      );
    }
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: FileImage(places[index].image),
            ),
            title: Text(
              places[index].name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => PlaceDetailsScreen(
                    place: places[index],
                  ),
                ),
              );
            },
          );
        },
        itemCount: places.length);
  }
}
