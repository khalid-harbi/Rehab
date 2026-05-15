import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

class HomeCard extends StatelessWidget {
  final HomeEntity home;
  const HomeCard({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        context.push(Routes.homeDetails, extra: home);
      },
      //todo : add shadow "leen" 
      // todo: and change to container instead of card
      // todo: fix ريال/شهريا
      //todo: why the image separated from the card ???
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(home.imageUrl, fit: BoxFit.cover),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    home.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),

                      const SizedBox(width: 4),

                      Text(home.city, style: theme.textTheme.bodySmall),
                    ],
                  ),


                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.apartment_outlined,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),

                      const SizedBox(width: 4),

                      // Text(home.propertyType, style: theme.textTheme.bodySmall),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        home.rating.toString(),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${home.price}  شهريا/ريال',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
