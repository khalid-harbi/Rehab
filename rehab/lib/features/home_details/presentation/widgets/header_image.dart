
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:rehab/features/home_details/presentation/widgets/circle_icone_buttom.dart';

class HeaderImage extends StatelessWidget {
  final HomeEntity home;

  const HeaderImage({required this.home});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(28),
          ),
          child: Image.network(
            home.imageUrl,
            height: 310,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          top: 45,
          left: 16,
          child: CircleIconButton(
            icon: Icons.arrow_back,
            onTap: () => context.pop(),
          ),
        ),

        Positioned(
          top: 45,
          right: 16,
          child: Row(
            children: [
              CircleIconButton(
                icon: Icons.favorite_border,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              CircleIconButton(
                icon: Icons.share_outlined,
                onTap: () {},
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 18,
          right: 18,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${home.price.toStringAsFixed(0)} ريال / الشهر',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: colors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}